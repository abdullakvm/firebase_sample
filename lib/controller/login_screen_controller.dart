import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_sample/utils/app_utils.dart';
import 'package:firebase_sample/views/Homescreen/homescreen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginScreenController with ChangeNotifier {
  Future<void> loginFn({
    required String emailAddress,
    required String password,
    required BuildContext context,
  }) async {
    try {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: emailAddress,
    password: password
  );
   if (credential.user != null) {
        AppUtils.snackbarUtil(
          context,
          message: "User Login Successfull",
          bgcolor: Colors.greenAccent,
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      }
} on FirebaseAuthException catch (e) {
   AppUtils.snackbarUtil(
          context,
          message: e.code,
          bgcolor: Colors.red,
        );
  // if (e.code == 'user-not-found') {
  //   print('No user found for that email.');
  // } else if (e.code == 'wrong-password') {
  //   print('Wrong password provided for that user.');
  // }
}
  }
}