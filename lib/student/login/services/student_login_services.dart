import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diente/student/data/models/student.dart';
import 'package:firebase_auth/firebase_auth.dart';

class StudentAuthFirebaseServices {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<StudentModel?> login(String email, String password) async {
    try {
      final userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final User? user = userCredential.user;
      if (user != null) {
        StudentModel userData = await StudentAuthFirebaseServices().fetchUser();
        return userData;
      }
    } on FirebaseAuthException catch (error) {
      String errorMessage;
      switch (error.code) {
        case "ERROR_EMAIL_ALREADY_IN_USE":
          errorMessage = "Email already used. Go to login page.";
          break;
        case "ERROR_WRONG_PASSWORD":
        case "wrong-password":
          errorMessage = "Wrong email/password combination.";
          break;
        default:
          errorMessage = "Login failed. Please try again.";
          break;
      }
      throw Exception(errorMessage);
    }
    return null;
  }

  Future fetchUser() async {
    try {
      final User? user = auth.currentUser;

      if (user == null) {
        throw Exception("No user is currently logged in.");
      }

      // Reference to the user document in the `users` collection
      DocumentSnapshot userDoc = await firestore
          .collection('students')
          .doc(auth.currentUser!.uid)
          .get();

      // Check if the document exists
      if (userDoc.exists) {
        // Return the user data as a Map
        log('user fetched');
        StudentModel? userData;
        try {
          userData =
              StudentModel.fromJson(userDoc.data() as Map<String, dynamic>);
        } on Exception catch (e) {
          log('error $e');
        }
        log(userData.toString() ?? 'null');
        return userData ??
            StudentModel(
              name: 'null',
              id: 'null',
              year: 'null',
              email: 'null',
              profilePic: 'null',
              phone: 'null',
            );
      } else {
        // Handle case where the document does not exist
        throw Exception("User document not found.");
      }
    } catch (e) {
      log("Error fetching user data: $e");
      rethrow;
    }
  }
}
