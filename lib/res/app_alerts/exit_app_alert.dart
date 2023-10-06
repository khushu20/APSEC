import 'dart:io';
import 'package:ap_sec/res/colors.dart';
import 'package:ap_sec/res/text_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class ExitAppAlert extends StatelessWidget {
  const ExitAppAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: AlertDialog(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              TextConstants.exitApp,
              style: TextStyle(
                  color: AppColors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                TextConstants.are_sure_exit_app,
                style: TextStyle(fontSize: 14.0),
              ),
            ),
          ],
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green)),
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'NO',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(AppColors.red)),
                  onPressed: () => {
                    if (Platform.isAndroid)
                      {SystemNavigator.pop()}
                    else if (Platform.isIOS)
                      {exit(0)}
                  },
                  child: const Text(
                    'YES',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
