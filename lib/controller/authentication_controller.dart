import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_sample/utils/app_utils.dart';
import 'package:firebase_sample/views/Loginscreen/loginscreen.dart';
import 'package:flutter/material.dart';

class AuthenticationController with ChangeNotifier {
  Future<void> authenticationFn({
    required String emailAddress,
    required String password,
    required BuildContext context,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );
      if (credential.user != null) {
        AppUtils.snackbarUtil(
          context,
          message: "user registartion successfull",
          bgcolor: Colors.greenAccent,
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        AppUtils.snackbarUtil(
          context,
          message: "The password provided is too weak",
          bgcolor: Colors.red,
        );
      } else if (e.code == 'email-already-in-use') {
        AppUtils.snackbarUtil(
          context,
          message: "Email already used",
          bgcolor: Colors.red,
        );
      }
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }
}
