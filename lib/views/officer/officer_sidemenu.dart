import 'package:ap_sec/res/app_alerts/exit_app_alert.dart';
import 'package:ap_sec/res/app_alerts/logout_alert.dart';
import 'package:ap_sec/res/colors.dart';
import 'package:ap_sec/res/image_constants.dart';
import 'package:ap_sec/res/text_constants.dart';
import 'package:ap_sec/routes/app_routes.dart';
import 'package:flutter/material.dart';

class OfficerSideMenu extends StatefulWidget {
  const OfficerSideMenu(
      {super.key, required this.username, required this.designation});
  final String username;
  final String designation;

  @override
  State<OfficerSideMenu> createState() => _OfficerSideMenuState();
}

class _OfficerSideMenuState extends State<OfficerSideMenu> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: AppColors.reusableGradient,
                ),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
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
                      Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            widget.username,
                            style: TextStyle(
                                color: AppColors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w700),
                          )),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Column(
                children: [
                  ListTile(
                    title: Container(
                      child: Row(
                        children: [
                          Image.asset(
                            ImageConstants.dashboard,
                            height: 30,
                            width: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(TextConstants.dashboard),
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        Navigator.pushReplacementNamed(
                            context, AppRoutes.officerdashboard);
                      });
                    },
                  ),
                  ListTile(
                    title: Container(
                      child: Row(
                        children: [
                          Image.asset(
                            ImageConstants.privacy,
                            height: 30,
                            width: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(TextConstants.privacyPolicy),
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.privacyPolicy);
                    },
                  ),
                  ListTile(
                    title: Container(
                      child: Row(
                        children: [
                          Image.asset(
                            ImageConstants.exit,
                            height: 30,
                            width: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(TextConstants.exitAppMenu),
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (BuildContext context) {
                          return ExitAppAlert();
                        },
                      );
                    },
                  ),
                  ListTile(
                    title: Container(
                      child: Row(
                        children: [
                          Image.asset(
                            ImageConstants.logout,
                            height: 30,
                            width: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(TextConstants.logout),
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (BuildContext context) {
                          return LogOutAlert();
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
