import 'package:ap_sec/res/colors.dart';
import 'package:ap_sec/res/text_constants.dart';
import 'package:flutter/cupertino.dart';


class ValidationIoSAlert {
  showAlert(BuildContext context,
      String title ) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(TextConstants.appName,style: TextStyle(fontSize: 15,color: AppColors.bgcolor),),
          content: Text("$title"),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('OK',style: TextStyle(color: AppColors.black),),
              onPressed: () {
                Navigator.of(context).pop();
               
              },
            ),
          ],
        );
      },
    );
  }
}
