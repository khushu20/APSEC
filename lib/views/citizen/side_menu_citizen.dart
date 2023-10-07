import 'package:ap_sec/res/colors.dart';
import 'package:ap_sec/res/image_constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../res/app_alerts/exit_app_alert.dart';
import '../../routes/app_routes.dart';

class SideMenuCitizen extends StatefulWidget {
  const SideMenuCitizen({super.key});
  @override
  State<SideMenuCitizen> createState() => _SideMenuCitizenState();
}

class _SideMenuCitizenState extends State<SideMenuCitizen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () {
          Navigator.pop(context);
          return Future.value(false);
        },
        child: Drawer(
          child: Column(
            // padding: EdgeInsets.zero,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.appThemeColor,
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 48, // Image radius
                            child: ClipOval(
                              child: Image.asset(ImageConstants.apecLogo),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            "app_name".tr(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Column(
                  children: [
                    ListTile(
                      title: Container(
                        child: Row(
                          children: [
                            Image.asset(
                              ImageConstants.privacy,
                              height: 20,
                              width: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("privacy_policy".tr()),
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
                              ImageConstants.profile,
                              height: 20,
                              width: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("app_info".tr()),
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.appInfo);
                      },
                    ),
                    ListTile(
                      title: Container(
                        child: Row(
                          children: [
                            Image.asset(
                              ImageConstants.exit,
                              height: 20,
                              width: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("exit".tr()),
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
