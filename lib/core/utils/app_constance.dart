// Packages
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// Core
import 'app_enums.dart';

class AppConstance {
  // CupertinoAlertDialog
  static void showErrorDialog({
    required BuildContext context,
    required String message,
  }) {
    showDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(
          message,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16.0,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            style: TextButton.styleFrom(
              foregroundColor: Colors.black,
              textStyle: const TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }

  // Fluttertoast package
  static void showToast({
    required String message,
    required ToastStates state,
  }) =>
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        // Show Long toast for 5 sec
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: chooseToastColor(state),
        textColor: Colors.white,
        fontSize: 16.0,
      );

  static Color chooseToastColor(ToastStates state) {
    Color color;

    switch (state) {
      case ToastStates.success:
        color = Colors.green;
        break;
      case ToastStates.error:
        color = Colors.red;
        break;
      case ToastStates.warning:
        color = Colors.amber;
        break;
    }
    return color;
  }
}
