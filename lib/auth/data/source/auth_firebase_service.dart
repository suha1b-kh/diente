import 'package:cloud_firestore/cloud_firestore.dart';
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
          id: user.uid,
          active: '',
          age: '',
          caseType: '',
          email: email,
          fullName: '',
          gender: '',
          medicalHistory: [],
          nationalId: '',
          password: password,
          phoneNum: '',
          profilePic: '',
          teeth: '',
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
        return UserModel(
          id: user.uid,
          active: '',
          age: '',
          caseType: '',
          email: email,
          fullName: '',
          gender: '',
          medicalHistory: [],
          nationalId: '',
          password: password,
          phoneNum: '',
          profilePic: '',
          teeth: '',
        );
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
      throw Exception(error.code);
    }
    return null;
  }

  // Future sendEmailVerification() {}
}
