import 'package:ap_sec/res/image_constants.dart';
import 'package:flutter/material.dart';

class ConfirmationAlert {
  showAlertConfirmation(BuildContext context,
      {String? title,
      String? buttontext1,
      String? buttontext2,
      Function()? onpressed1,
      Function()? onpressed2,
      String? message}) {
    showDialog(
        context: context,
        builder: (BuildContext dialogContext) {
          return AlertDialog(
            title: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Image.asset(
                    ImageConstants.appIcon,
                    height: 30,
                    width: 30,
                  ),
                ),
                Text("${title}"),
              ],
            ),
            content: Text("${message}", style: TextStyle(fontSize: 14)),
            actions: [
              TextButton(onPressed: onpressed1, child: Text("${buttontext1}")),
              TextButton(onPressed: onpressed2, child: Text("${buttontext2}")),
            ],
          );
        });
  }
}
