import 'dart:convert';
import 'dart:io';

import 'package:ap_sec/res/app_alerts/custom_error_alert.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ErrorHandlingUtils {
  static String handleError(dynamic e, BuildContext context) {
    String msg = "";
    if (e is DioException) {
      if (e.response?.statusCode == 401) {
        final responseBody = e.response?.data;
        if (responseBody != null) {
          final jsonData = json.encode(responseBody);
          msg = getErrorMessage(jsonData);
        }
      } else if (e.type == DioExceptionType.connectionTimeout) {
        msg = "Connection timed out";
      } else if (e.type == DioExceptionType.receiveTimeout) {
        msg = "Receive timeout occurred.";
      } else {
        msg = "Server not responding: ${e.message}";
      }
    } else if (e is SocketException) {
      msg = "Something went wrong: ${e.message}";
    } else {
      msg = "Something went wrong: ${e.toString()}";
    }
    return msg;
  }

  static String getErrorMessage(String jsonData) {
    try {
      final parsedJson = json.decode(jsonData);
      return parsedJson['error']['message'];
    } catch (e) {
      return "Something went wrong, Please try again later";
    }
  }

  showErrorDialog(BuildContext context, String errorMessage) {
    return showDialog(
      context: context,
      builder: (context) {
        return CustomErrorAlert(
          descriptions: errorMessage,
          onPressed: () {
            Navigator.pop(context);
          },
          //Img: AssetPath.error
        );
      },
    );
  }
}
