import 'package:ap_sec/res/app_alerts/custom_error_alert.dart';
import 'package:ap_sec/res/app_alerts/validation_ios_alert.dart';
import 'package:ap_sec/res/colors.dart';
import 'package:ap_sec/res/components/custom_appbar.dart';
import 'package:ap_sec/res/image_constants.dart';
import 'package:ap_sec/res/text_constants.dart';
import 'package:ap_sec/routes/app_routes.dart';
import 'package:ap_sec/utils/internet_check.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';

class SetMpinScreen extends StatefulWidget {
  const SetMpinScreen({super.key});

  @override
  State<SetMpinScreen> createState() => _SetMpinScreenState();
}

class _SetMpinScreenState extends State<SetMpinScreen> {
  TextEditingController enterMpin = TextEditingController();
  TextEditingController re_enterMpin = TextEditingController();
  String mobileOtp = "";
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pushReplacementNamed(context, AppRoutes.otp);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: GradientAppBar(
          IconButton: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushReplacementNamed(context, AppRoutes.otp);
            },
          ),
          title: TextConstants.appName,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 80,
              ),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 15),
                elevation: 5,
                color: AppColors.appThemeColor,
                shadowColor: AppColors.end,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: AppColors.white,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(
                            ImageConstants.profile,
                            height: 100,
                            width: 100,
                          ),
                        ),
                        Center(
                            child: Text(
                          "Generate Mpin",
                          style: TextStyle(fontSize: 20),
                        )),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Enter Mpin",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        PinCodeFields(
                          length: 4,
                          fieldBorderStyle: FieldBorderStyle.square,
                          controller: enterMpin,
                          responsive: false,
                          fieldHeight: 45.0,
                          fieldWidth: 45.0,
                          borderWidth: 1.0,
                          obscureCharacter: '⬤',
                          obscureText: true,
                          activeBorderColor: AppColors.appThemeColor,
                          activeBackgroundColor: AppColors.bgcolor,
                          borderRadius: BorderRadius.circular(10.0),
                          keyboardType: TextInputType.number,
                          autoHideKeyboard: true,
                          fieldBackgroundColor: Colors.black12,
                          borderColor: AppColors.bgcolor,
                          textStyle: TextStyle(
                            color: AppColors.bgcolor,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                          onComplete: (mpinOutput) {
                            print(mpinOutput);
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Re-Enter Mpin",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        PinCodeFields(
                          length: 4,
                          fieldBorderStyle: FieldBorderStyle.square,
                          controller: re_enterMpin,
                          responsive: false,
                          fieldHeight: 45.0,
                          fieldWidth: 45.0,
                          borderWidth: 1.0,
                          obscureCharacter: '⬤',
                          obscureText: true,
                          activeBorderColor: AppColors.appThemeColor,
                          activeBackgroundColor: AppColors.bgcolor,
                          borderRadius: BorderRadius.circular(10.0),
                          keyboardType: TextInputType.number,
                          autoHideKeyboard: true,
                          fieldBackgroundColor: Colors.black12,
                          borderColor: AppColors.bgcolor,
                          textStyle: TextStyle(
                            color: AppColors.bgcolor,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                          onComplete: (mpinOutput) {
                            print(mpinOutput);
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 50),
                            child: Text(
                              "Proceed",
                              style: TextStyle(
                                  fontSize: 18, color: AppColors.white),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            backgroundColor: AppColors.appThemeColor,
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontStyle: FontStyle.normal),
                          ),
                          onPressed: () async {
                            if (userValidations(context)) if (await InternetCheck()
                                .hasInternetConnection()) {
                              Navigator.pushReplacementNamed(
                                  context, AppRoutes.validateMpin);
                            } else {
                              showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (context) {
                                  return CustomErrorAlert(
                                    descriptions:
                                        TextConstants.plz_check_internet,
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  );
                                },
                              );
                            }
                          },
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              gradient: AppColors.sampleGradient,
            ),
            child: Image.asset(
              ImageConstants.footerwhite,
              width: double.infinity,
              height: 40,
            ),
          ),
        ),
      ),
    );
  }

  bool userValidations(BuildContext context) {
    if (enterMpin.text.isEmpty) {
      ValidationIoSAlert().showAlert(context, "Please enter Mpin");
      return false;
    } else if (enterMpin.text.length < 4) {
      ValidationIoSAlert().showAlert(context, "Please enter 4 digit Mpin");
      return false;
    } else if (enterMpin.text.toString() == "0000") {
      ValidationIoSAlert().showAlert(context, "Please enter valid Mpin");
      return false;
    } else if (re_enterMpin.text.isEmpty) {
      ValidationIoSAlert().showAlert(context, "Please Re-Enter Mpin");
      return false;
    } else if (re_enterMpin.text.length < 4) {
      ValidationIoSAlert().showAlert(context, "Please  Re-Enter 4 digit Mpin");
      return false;
    } else if (re_enterMpin.text.toString() == "0000") {
      ValidationIoSAlert().showAlert(context, "Please  Re-Enter valid Mpin");
      return false;
    } else if (enterMpin.text.toString() != re_enterMpin.text.toString()) {
      ValidationIoSAlert().showAlert(context, "Mpin not matched");
      return false;
    }
    return true;
  }
}
