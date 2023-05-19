import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static void toastMessage(String message) {
    Fluttertoast.showToast(msg: message);
  }

  static void snackBarMessage(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
      ),
    );
  }

  static void flushBarMessage(String message, BuildContext context) {
    Flushbar(
      message: message,
      backgroundColor: Colors.red,
    ).show(context);
  }
}
