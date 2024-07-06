import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class Login {
  static Future login({required String email, required String password}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return 'true';
      log('success');
    } on FirebaseAuthException catch (e) {
      log('error');
    }
  }
}
