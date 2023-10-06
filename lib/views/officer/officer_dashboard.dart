import 'package:ap_sec/res/app_alerts/exit_app_alert.dart';
import 'package:ap_sec/res/app_alerts/logout_alert.dart';
import 'package:ap_sec/res/colors.dart';
import 'package:ap_sec/res/image_constants.dart';
import 'package:ap_sec/res/text_constants.dart';
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
            appBar:AppBar(
               iconTheme: IconThemeData(color: AppColors.white),
              title: Center(child: Text(TextConstants.dashboard,style: TextStyle(color: AppColors.white),)),
              backgroundColor: AppColors.appThemeColor,
              actions: [
                IconButton(
                  onPressed: () {
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return LogOutAlert();
                      },
                    );
                  },
                  icon: Icon(Icons.logout,color: AppColors.white,),
                )
              ],
            ),
            drawer: OfficerSideMenu(username: "Khushboo", designation: ""),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  /*   Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      color: AppColors.white,
                      child: Center(
                          child: Text(
                            
                        TextConstants.application_status,
                        style: TextStyle(
                            color: AppColors.black,
                            fontSize: 18,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500),
                      ))), */
                  
                    
                 
                ],
              ),
            ),
            bottomNavigationBar: Container(
              
              //color
color: AppColors.appThemeColor,
              height: MediaQuery.of(context).size.height * 0.06,
              child: Image.asset(
                
                ImageConstants.footerwhite,
                width: double.infinity,
              ),
            ),
          ),
         
        ],
      ),
    );
  }



}
