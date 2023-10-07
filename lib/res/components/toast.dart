import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ShowToasts {
  static showToast(String msg,
      {ToastGravity? gravity, Color? bgcolor, Color? textcolor}) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: gravity ?? ToastGravity.BOTTOM,
      backgroundColor: bgcolor ?? Colors.black,
      textColor: textcolor ?? Colors.white,
      fontSize: 16.0,
    );
  }
}
