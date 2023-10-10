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

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController otp = TextEditingController();
  String mobileOtp = "";
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pushReplacementNamed(
              context, AppRoutes.sample);
          return Future.value(false);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: GradientAppBar(
          IconButton: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushReplacementNamed(context, AppRoutes.sample);
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
                        Image.asset(
                          ImageConstants.profile,
                          height: 100,
                          width: 100,
                        ),
                        Center(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Verification Code",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        )),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10),
                          child: Center(
                              child: Text(
                            "Please enter the verification code sent to mobile ",
                            style: TextStyle(fontSize: 16),
                          )),
                        ),
                        PinCodeFields(
                          length: 6,
                          fieldBorderStyle: FieldBorderStyle.square,
                          controller: otp,
                          responsive: true,
                          fieldHeight: 45.0,
                          fieldWidth: 35.0,
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
                        Center(
                            child: Text(
                          "Didn't receive the OTP ?",
                          style: TextStyle(fontSize: 16),
                        )),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Center(
                              child: Text(
                            "Resend OTP ?",
                            style: TextStyle(
                                fontSize: 18,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        ElevatedButton(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 50),
                            child: Text(
                              TextConstants.submit,
                              style:
                                  TextStyle(fontSize: 18, color: AppColors.white),
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
                                  context, AppRoutes.setMpin);
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
    if (otp.text.isEmpty) {
      ValidationIoSAlert().showAlert(context, "Please enter OTP");
      return false;
    } else if (otp.text.length < 6) {
      ValidationIoSAlert().showAlert(context, "Please enter 6 digit OTP");
      return false;
    }

    return true;
  }
}
