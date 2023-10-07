import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:ap_sec/res/colors.dart';
import 'package:ap_sec/res/image_constants.dart';
import 'package:ap_sec/res/text_constants.dart';
import 'package:ap_sec/views/otp_screen.dart';
import 'package:ap_sec/views/sample_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
                           
                            gradient: LinearGradient(
                              colors: [
                                const Color.fromARGB(255, 41, 81, 202),
                                AppColors.middle,
                                AppColors.end,
                              ], // Define your gradient colors here
                              begin: Alignment
                                  .topCenter,
                               // Adjust the gradient start position
                              end: Alignment
                                  .bottomCenter, // Adjust the gradient end position
                            ),
                          ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              TextConstants.appNameView,
              style: TextStyle(
                  color: AppColors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 50,
            ),
            Center(
              child: CircleAvatar(
                  radius: 80,
                  backgroundColor: AppColors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ClipOval(
                      child: AnimatedSplashScreen(
                        splash: Image.asset(
                          ImageConstants.appIcon,
                          height: 160,
                          width: 160,
                        ),
                        nextScreen: OtpScreen(),
                        splashTransition: SplashTransition.rotationTransition,
                        backgroundColor: Color.fromARGB(221, 200, 204, 232),
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
