
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static void feildFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.red,
        toastLength: Toast.LENGTH_LONG,
        textColor: Colors.white);
  }

 

  static snackBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.green,
      content: Text(message),
    ));
  }
}

//  Utils.snackBar("No Internet Connection", context);
              // Utils.flushBarErrorMessage("No Internet Connection",
              //   context
              // );
              // Utils.toastMessage("No Internet Connection");
              //  Navigator.pushNamed(context, RouteName.home);