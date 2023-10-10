import 'package:ap_sec/res/app_alerts/exit_app_alert.dart';
import 'package:ap_sec/res/colors.dart';
import 'package:ap_sec/res/components/custom_appbar.dart';
import 'package:ap_sec/res/image_constants.dart';
import 'package:ap_sec/res/sharedpreferences/share_pref_constants.dart';
import 'package:ap_sec/res/text_constants.dart';
import 'package:ap_sec/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SampleScreen extends StatefulWidget {
  const SampleScreen({super.key});

  @override
  State<SampleScreen> createState() => _SampleScreenState();
}

class _SampleScreenState extends State<SampleScreen> {
  bool loginFlag = true;
  final mobileNoController = TextEditingController();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        ExitAppAlert();
        return Future.value(false);
      },
      child: Scaffold(
          appBar: GradientAppBar(
              title: TextConstants.appName, automaticallyImplyLeading: false),
          body: SingleChildScrollView(
            child: Column(
              children: [
                /*      Container(
              height: 50,
              child: Marquee(
                text: 'Welcome to Login',
                style: TextStyle(fontSize: 20.0),
                scrollAxis: Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.start,
                blankSpace: 20.0,
                velocity: 50.0,
                pauseAfterRound: Duration(seconds: 1),
                startPadding: 10.0,
                accelerationDuration: Duration(seconds: 1),
                accelerationCurve: Curves.linear,
                decelerationDuration: Duration(milliseconds: 500),
                decelerationCurve: Curves.easeOut,
              ),
            ), */
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                  child: CircleAvatar(
                    backgroundColor: Color.fromARGB(221, 200, 204, 232),
                    radius: 50,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Image.asset(
                         ImageConstants.apecLogo,
                        height: 80,
                        width: 80,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Stack(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        loginFlag
                            ? Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(30),
                                    bottomRight: Radius.circular(30),
                                  ),
                                  gradient: LinearGradient(
                                    colors: [
                                      const Color.fromARGB(255, 41, 81, 202),
                                      AppColors.middle,
                                      AppColors.end,
                                    ], // Define your gradient colors here
                                    begin: Alignment
                                        .topCenter, // Adjust the gradient start position
                                    end: Alignment
                                        .bottomCenter, // Adjust the gradient end position
                                  ),
                                ),
                                height:
                                    MediaQuery.of(context).size.height * 0.5,
                                width: MediaQuery.of(context).size.width * 0.47,
                                child: GestureDetector(
                                  onTap: () {
                                    print("am being tapped");
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "CITIZEN",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: AppColors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ),
                                ))
                            : Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(30),
                                      bottomRight: Radius.circular(30),
                                    ),
                                    color: Colors.white),
                                height:
                                    MediaQuery.of(context).size.height * 0.5,
                                width: MediaQuery.of(context).size.width * 0.47,
                                child: GestureDetector(
                                  onTap: () {
                                    print("am being tapped");
                                  },
                                  child: GestureDetector(
                                    onTap: () => setState(() {
                                      loginFlag = true;
                                    }),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "CITIZEN",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: AppColors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    ),
                                  ),
                                )),
                        SizedBox(
                          width: 20,
                        ),
                        !loginFlag
                            ? Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    bottomLeft: Radius.circular(30),
                                  ),
                                  gradient: LinearGradient(
                                    colors: [
                                      const Color.fromARGB(255, 41, 81, 202),
                                      AppColors.middle,
                                      AppColors.end,
                                    ], // Define your gradient colors here
                                    begin: Alignment
                                        .topCenter, // Adjust the gradient start position
                                    end: Alignment
                                        .bottomCenter, // Adjust the gradient end position
                                  ),
                                ),
                                height:
                                    MediaQuery.of(context).size.height * 0.5,
                                width: MediaQuery.of(context).size.width * 0.47,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      print("am being tapped");
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "OFFICER",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: AppColors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    bottomLeft: Radius.circular(30),
                                  ),
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.white,
                                      Colors.white,
                                    ], // Define your gradient colors here
                                    begin: Alignment
                                        .topCenter, // Adjust the gradient start position
                                    end: Alignment
                                        .bottomCenter, // Adjust the gradient end position
                                  ),
                                ),
                                height:
                                    MediaQuery.of(context).size.height * 0.5,
                                width: MediaQuery.of(context).size.width * 0.47,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      print("am being tapped");
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                        onTap: () => setState(() {
                                          loginFlag = false;
                                        }),
                                        child: Text(
                                          "OFFICER",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: AppColors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                      ],
                    ),
                    !loginFlag
                        ? Container(
                            height: MediaQuery.of(context).size.height * 0.4,
                            margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.05),
                            child: Stack(
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.35,
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 30,
                                    vertical: 20,
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 25),
                                        child: TextField(
                                          controller:
                                              userNameController, // Assign the controller
                                          decoration: InputDecoration(
                                            labelText: 'User ID',
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 5),
                                        child: TextField(
                                          controller: passwordController,
                                          obscureText:
                                              true, // Assign the controller
                                          decoration: InputDecoration(
                                            labelText: 'Password',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    color: Color.fromARGB(221, 200, 204, 232),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                Positioned(
                                  right:
                                      MediaQuery.of(context).size.width * 0.25,
                                  left:
                                      MediaQuery.of(context).size.width * 0.25,
                                  bottom: 2.5,
                                  child: GestureDetector(
                                    onTap: () async {
                                      SharedPreferences prefs =
                                          await SharedPreferences.getInstance();
                                      prefs.setString(
                                          SharedConstants.loginType, "officer");
                                      Navigator.pushReplacementNamed(
                                          context, AppRoutes.otp);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: AppColors.buttoncolor,
                                      ),
                                      height: 40,
                                      width: 100,
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Login",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        : Container(
                            height: MediaQuery.of(context).size.height * 0.4,
                            margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.05),
                            child: Stack(
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.35,
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 30,
                                    vertical: 40,
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 50),
                                        child: TextField(
                                          controller:
                                              userNameController, // Assign the controller
                                          decoration: InputDecoration(
                                            labelText: 'Mobile No',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    color: Color.fromARGB(221, 200, 204, 232),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                Positioned(
                                  right:
                                      MediaQuery.of(context).size.width * 0.25,
                                  left:
                                      MediaQuery.of(context).size.width * 0.25,
                                  bottom: 20,
                                  child: GestureDetector(
                                    onTap: () async {
                                      SharedPreferences prefs =
                                          await SharedPreferences.getInstance();
                                      prefs.setString(
                                          SharedConstants.loginType, "citizen");
                                      Navigator.pushReplacementNamed(
                                          context, AppRoutes.otp);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: AppColors.buttoncolor,
                                      ),
                                      height: 40,
                                      width: 100,
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Login",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
