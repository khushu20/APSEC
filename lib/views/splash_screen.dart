import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:ap_sec/res/colors.dart';
import 'package:ap_sec/res/image_constants.dart';
import 'package:ap_sec/res/text_constants.dart';
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
        decoration: BoxDecoration(gradient: AppColors.reusableGradient),
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
                          ImageConstants.apecLogo,
                          height: 160,
                          width: 160,
                        ),
                        nextScreen: SampleScreen(),
                        splashTransition: SplashTransition.rotationTransition,
                  
                        backgroundColor: AppColors.bgcolor,
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
