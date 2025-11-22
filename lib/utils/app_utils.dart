import 'package:flutter/material.dart';

class AppUtils {
  static void snackbarUtil(BuildContext context, {required String message , Color bgcolor = Colors.white}) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message),backgroundColor: bgcolor));
  }
}
