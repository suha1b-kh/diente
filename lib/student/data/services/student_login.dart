import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diente/student/data/models/student.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class StudentServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<StudentModel> fetchStudent() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    try {
      final User? student = auth.currentUser;

      if (student == null) {
        throw Exception("No user is currently logged in.");
      }

      DocumentSnapshot userDoc = await firestore
          .collection('students')
          .doc(auth.currentUser!.uid)
          .get();

      if (userDoc.exists) {
        log('user feetched');
        StudentModel? studentData;
        try {
          studentData =
              StudentModel.fromJson(userDoc.data() as Map<String, dynamic>);
        } on Exception catch (e) {
          log('error $e');
        }
        return studentData ??
            StudentModel(
              name: 'No name',
              id: 'No id',
              year: 'No year',
              email: 'No email',
              profilePic: 'No profile pic',
              phone: 'No phone',
            );
      } else {
        throw Exception("student User document not found.");
      }
    } catch (e) {
      log("Error fetching user data: $e");
      throw Exception("Error fetching user data");
    }
  }

  Future<StudentModel?> studentLogin(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return fetchStudent();
    } catch (e) {
      log('Error logging in: $e');
      return null;
    }
  }
}
