import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diente/auth/data/models/medical_history_model.dart';
import 'package:diente/auth/data/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

// abstract class AuthFirebaseService {
//   Future signup(UserModel user);
// Future<Either> signin(UserSigninReq user);
// Future<Either> getAges();
// Future<Either> sendPasswordResetEmail(String email);
// Future<bool> isLoggedIn();
// Future<Either> getUser();
// }

class AuthFirebaseService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  AuthFirebaseService();

  Future<UserModel?> signup(String email, String password) async {
    try {
      final userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final User? user = userCredential.user;

      if (user != null) {
        return UserModel(
          age: '',
          email: email,
          firstName: '',
          secondName: '',
          gender: '',
          medicalHistory: [],
          phoneNum: '',
          profilePic: '',
        );
      }
    } on FirebaseAuthException catch (error) {
      String errorMessage;
      switch (error.code) {
        case "invalid-email":
          errorMessage = "Your email address appears to be badly formatted.";
          break;
        case "weak-password":
          errorMessage = "Your password is too weak.";
          break;
        case "email-already-in-use":
          errorMessage = "This email address is already in use.";
          break;
        case "operation-not-allowed":
          errorMessage = "Signing in with Email and Password is not enabled.";
          break;
        case "user-disabled":
          errorMessage = "This user has been disabled.";
          break;
        case "too-many-requests":
          errorMessage = "Too many requests. Please try again later.";
          break;
        default:
          errorMessage = "An unexpected error occurred: ${error.message}";
      }

      throw Exception(errorMessage);
    }
    return null;
  }

  Future<UserModel?> login(String email, String password) async {
    try {
      final userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final User? user = userCredential.user;
      if (user != null) {
        UserModel userData = await AuthFirebaseService().fetchUser();
        return userData;
      }
    } on FirebaseAuthException catch (error) {
      String errorMessage;
      switch (error.code) {
        case "ERROR_EMAIL_ALREADY_IN_USE":
        case "account-exists-with-different-credential":
        case "email-already-in-use":
          errorMessage = "Email already used. Go to login page.";
          break;
        case "ERROR_WRONG_PASSWORD":
        case "wrong-password":
          errorMessage = "Wrong email/password combination.";
          break;
        case "user-not-found":
          errorMessage = "No user found with this email.";
          break;
        case "ERROR_USER_DISABLED":
        case "user-disabled":
          errorMessage = "User disabled.";
          break;
        case "ERROR_TOO_MANY_REQUESTS":
        case "operation-not-allowed":
          errorMessage = "Too many requests to log into this account.";
          break;
        case "ERROR_OPERATION_NOT_ALLOWED":
        case "operation-not-allowed":
          errorMessage = "Server error, please try again later.";
          break;
        case "ERROR_INVALID_EMAIL":
        case "invalid-email":
          errorMessage = "Email address is invalid.";
          break;
        default:
          errorMessage = "Login failed. Please try again.";
          break;
      }
      throw Exception(errorMessage);
    }
    return null;
  }

  Future<void> createUser(UserModel user) async {
    try {
      await firestore.collection('patients').doc(user.email).set(user.toMap());
      log('user created');
    } on FirebaseException catch (e) {
      log('error $e');
    }
  }

  Future<UserModel> fetchUser() async {
    try {
      final User? user = auth.currentUser;

      if (user == null) {
        throw Exception("No user is currently logged in.");
      }

      // Reference to the user document in the `users` collection
      DocumentSnapshot userDoc =
          await firestore.collection('patients').doc(user.email).get();

      // Check if the document exists
      if (userDoc.exists) {
        // Return the user data as a Map
        log('user feetched');

        UserModel userData =
            UserModel.fromMap(userDoc.data() as Map<String, dynamic>);
        log(userData.toString());
        return userData;
      } else {
        // Handle case where the document does not exist
        throw Exception("User document not found.");
      }
    } catch (e) {
      print("Error fetching user data: $e");
      rethrow;
    }
  }

  Future<void> fillMedicalHistory(MedicalHistoryModel medModel) async {}
}
