import 'package:ap_sec/res/image_constants.dart';
import 'package:flutter/material.dart';

import '../../network/app_strings.dart';
import '../colors.dart';

class InternetCheckAlert extends StatefulWidget {
  final double? width;
  final double? height;
  const InternetCheckAlert({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  _InternetCheckAlertState createState() => _InternetCheckAlertState();
}

class _InternetCheckAlertState extends State<InternetCheckAlert> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: contentBox(context),
      ),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 10, top: 50, right: 10, bottom: 10),
          margin: EdgeInsets.only(top: 30),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(0.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                AppStrings.internet_check,
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 8,
              ),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40))),
                        minimumSize: MaterialStateProperty.all(Size(220, 40)),
                        backgroundColor:
                            MaterialStateProperty.all(AppColors.red)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      AppStrings.ok,
                      style: TextStyle(fontSize: 14),
                    )),
              ),
            ],
          ),
        ),
        Positioned(
          left: 10,
          right: 10,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 35,
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(35)),
                  child: Image.asset(
                    ImageConstants.crossIcon,
                    fit: BoxFit.cover,
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
