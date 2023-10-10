import 'package:ap_sec/res/app_alerts/exit_app_alert.dart';
import 'package:ap_sec/res/app_alerts/logout_alert.dart';
import 'package:ap_sec/res/colors.dart';
import 'package:ap_sec/res/components/custom_appbar.dart';
import 'package:ap_sec/res/image_constants.dart';
import 'package:ap_sec/res/text_constants.dart';
import 'package:ap_sec/routes/app_routes.dart';
import 'package:ap_sec/views/officer/officer_sidemenu.dart';
import 'package:flutter/material.dart';

class OfficerDashboard extends StatefulWidget {
  const OfficerDashboard({super.key});

  @override
  State<OfficerDashboard> createState() => _OfficerDashboardState();
}

class _OfficerDashboardState extends State<OfficerDashboard> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return ExitAppAlert();
          },
        );
        return Future.value(false);
      },
      child: Stack(
        children: [
          Scaffold(
            appBar: GradientAppBar(
              title: TextConstants.dashboard,
              actions: [
                IconButton(
                    icon: Icon(Icons.logout),
                    onPressed: () {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (BuildContext context) {
                          return LogOutAlert();
                        },
                      );
                    })
              ],
            ),
            drawer: OfficerSideMenu(username: "Khushboo", designation: ""),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Column(
                      children: [
                        Image.asset(
                          ImageConstants.profile,
                          height: 100,
                          width: 100,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "9828738833",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Text(
                              "District",
                              style: TextStyle(fontSize: 16),
                            )),
                        Expanded(flex: 2, child: Text(""))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text("Municipality",
                              style: TextStyle(fontSize: 16)),
                        ),
                        Expanded(flex: 2, child: Text(""))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child:
                                Text("Ward", style: TextStyle(fontSize: 16))),
                        Expanded(flex: 2, child: Text(""))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Text("Polling Station",
                                style: TextStyle(fontSize: 16))),
                        Expanded(flex: 2, child: Text(""))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(gradient: AppColors.reusableGradient), // Customize the color as needed
                      child: ListTile(
                        leading: Image.asset(ImageConstants.polling,height: 30,width: 30,), // Replace with your icon
                        title: Text(
                          "PS wise Entry",
                          style: TextStyle(
                            fontFamily: 'muli_bold',
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                        onTap: () {
                         Navigator.pushReplacementNamed(context, AppRoutes.pswiseentry);
                        },
                      ),
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(gradient: AppColors.reusableGradient), // Customize the color as needed
                      child: ListTile(
                        leading:Image.asset(ImageConstants.status,height: 30,width: 30), // Replace with your icon
                        title: Text(
                          "DE-Link PS",
                          style: TextStyle(
                            fontFamily: 'muli_bold',
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                        onTap: () {
                          // Handle card tap event
                        },
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
        ],
      ),
    );
  }
}
