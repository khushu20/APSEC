import 'package:ap_sec/res/image_constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../res/colors.dart';
import '../res/components/custom_appbar.dart';

class AppInfo extends StatefulWidget {
  const AppInfo({super.key});

  @override
  State<AppInfo> createState() => _AppInfoState();
}

class _AppInfoState extends State<AppInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: GradientAppBar(
        automaticallyImplyLeading: true,
        title: "app_name".tr(),
        actions: [
          Icon(
            Icons.logout,
            color: Colors.transparent,
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.appThemeColor,
                  width: 2.0,
                ),
              ),
              child: CircleAvatar(
                backgroundColor: AppColors.white,
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
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "version".tr(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          "VersionNumber",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "last_updated_date".tr(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          "07-10-2023(Static)",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
