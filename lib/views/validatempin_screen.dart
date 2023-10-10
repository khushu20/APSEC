import 'package:ap_sec/res/app_alerts/custom_error_alert.dart';
import 'package:ap_sec/res/app_alerts/validation_ios_alert.dart';
import 'package:ap_sec/res/colors.dart';
import 'package:ap_sec/res/components/custom_appbar.dart';
import 'package:ap_sec/res/image_constants.dart';
import 'package:ap_sec/res/sharedpreferences/share_pref_constants.dart';
import 'package:ap_sec/res/text_constants.dart';
import 'package:ap_sec/routes/app_routes.dart';
import 'package:ap_sec/utils/internet_check.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ValidateMpinScreen extends StatefulWidget {
  const ValidateMpinScreen({super.key});

  @override
  State<ValidateMpinScreen> createState() => _ValidateMpinScreenState();
}

class _ValidateMpinScreenState extends State<ValidateMpinScreen> {
  TextEditingController enterMpin = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pushReplacementNamed(
              context, AppRoutes.setMpin);
          return Future.value(false);
      },
      child: Scaffold(
        appBar: GradientAppBar(
          IconButton: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushReplacementNamed(context, AppRoutes.setMpin);
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
                        SizedBox(
                          height: 30,
                        ),
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
                          "Validate Mpin",
                          style: TextStyle(fontSize: 20),
                        )),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Enter Mpin",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        SizedBox(
                          height: 10,
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
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacementNamed(
                                        context, AppRoutes.sample);
                                  },
                                  child: Text("Not You")),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacementNamed(
                                        context, AppRoutes.setMpin);
                                  },
                                  child: Text("Forgot Mpin ?"))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        ElevatedButton(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 50),
                            child: Text(
                              "Validate Mpin",
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
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              String loginType = await prefs
                                      .getString(SharedConstants.loginType) ??
                                  "";
                              if (loginType == "citizen") {
                                Navigator.pushReplacementNamed(
                                    context, AppRoutes.downloadVoterSlip);
                              } else if (loginType == "officer") {
                                Navigator.pushReplacementNamed(
                                    context, AppRoutes.officerdashboard);
                              }
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

  @override
  void dispose() {
    enterMpin.dispose();
    enterMpin.dispose();
    super.dispose();
  }

  bool userValidations(BuildContext context) {
    if (enterMpin.text.isEmpty) {
      ValidationIoSAlert().showAlert(context, "Please enter Mpin");
      return false;
    } else if (enterMpin.text.length < 4) {
      ValidationIoSAlert().showAlert(context, "Please enter 4 digit Mpin");
      return false;
    }
    else if (enterMpin.text.toString()=="0000") {
      ValidationIoSAlert().showAlert(context, "Please enter valid Mpin");
      return false;
    }
    return true;
  }
}
