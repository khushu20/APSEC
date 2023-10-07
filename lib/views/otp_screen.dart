import 'package:ap_sec/res/app_alerts/custom_error_alert.dart';
import 'package:ap_sec/res/colors.dart';
import 'package:ap_sec/res/components/custom_appbar.dart';
import 'package:ap_sec/res/image_constants.dart';
import 'package:ap_sec/res/text_constants.dart';
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
    return Scaffold(
      appBar: GradientAppBar(
          title: TextConstants.appName, automaticallyImplyLeading: false),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image.asset(ImageConstants.profile),
            ),
            Center(
                child: Text(
              "Verification Code",
              style: TextStyle(fontSize: 20),
            )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: Text(
                "Please enter the verification code sent to mobile ",
                style: TextStyle(fontSize: 16),
              )),
            ),
            PinCodeFields(
              length: 4,
              fieldBorderStyle: FieldBorderStyle.square,
              controller: otp,
              responsive: false,
              fieldHeight: 45.0,
              fieldWidth: 45.0,
              borderWidth: 1.0,
              obscureCharacter: '⬤',
              obscureText: true,
              activeBorderColor: Color.fromARGB(221, 200, 204, 232),
              activeBackgroundColor: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              keyboardType: TextInputType.number,
              autoHideKeyboard: true,
              fieldBackgroundColor: Colors.black12,
              borderColor: Color.fromARGB(221, 200, 204, 232),
              textStyle: TextStyle(
                color: Color.fromARGB(221, 200, 204, 232),
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
              onComplete: (mpinOutput) {
                print(mpinOutput);
              },
            ),
            SizedBox(
              height: 50,
            ),
             Center(
                child: Text(
              "Didn't receive the OTP ?",
              style: TextStyle(fontSize: 16),
            )),
            Padding(
              padding: const EdgeInsets.only(top:10.0),
              child: Center(
                  child: Text(
                "Resend OTP ?",
                style: TextStyle(fontSize: 18,fontStyle: FontStyle.normal,fontWeight: FontWeight.bold),
              )),
            ),
            SizedBox(
              height: 30,
            ),
          
            ElevatedButton(
              
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15 , horizontal: 50),
                child: Text(
                  TextConstants.submit,
                  style: TextStyle(fontSize: 18, color: AppColors.white),
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
                } else {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return CustomErrorAlert(
                        descriptions: TextConstants.plz_check_internet,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      );
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

bool userValidations(BuildContext context) {
  return true;
}
