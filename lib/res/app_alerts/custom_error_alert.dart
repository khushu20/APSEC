import 'package:ap_sec/res/colors.dart';
import 'package:ap_sec/res/image_constants.dart';
import 'package:ap_sec/res/text_constants.dart';
import 'package:flutter/material.dart';


class CustomErrorAlert extends StatefulWidget {
  final String descriptions;
  final String? Buttontext;
  final String? Img;
  final Color? imagebg;
  final Color? bgColor;
  final void Function()? onPressed;

  const CustomErrorAlert({
    Key? key,
    required this.descriptions,
    this.Buttontext,
    required this.onPressed,
    this.bgColor,
    this.Img,
    this.imagebg,
  }) : super(key: key);

  @override
  _CustomErrorAlertState createState() => _CustomErrorAlertState();
}

class _CustomErrorAlertState extends State<CustomErrorAlert> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return WillPopScope(
      onWillPop:() {
        return Future.value(false);
      },
      child: Stack(
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
                  'Version: ${TextConstants.versionNumber} ',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  TextConstants.appName,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.descriptions,
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
                          backgroundColor: MaterialStateProperty.all(
                              widget.bgColor ?? AppColors.red)),
                      onPressed: widget.onPressed,
                      child: Text(
                        widget.Buttontext ?? 'OK',
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
                backgroundColor: widget.imagebg ?? Colors.white,
                radius: 35,
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(45)),
                    child: Image.asset(
                      widget.Img ?? ImageConstants.appIcon,
                      // width: 100, height: 100,
                      fit: BoxFit.cover,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
