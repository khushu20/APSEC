import 'package:ap_sec/routes/app_routes.dart';
import 'package:ap_sec/views/login_screen.dart';
import 'package:ap_sec/views/officer/officer_dashboard.dart';
import 'package:ap_sec/views/officer/privacy_policy.dart';
import 'package:ap_sec/views/splash_screen.dart';
import 'package:flutter/cupertino.dart';


class AppPages {
  static Map<String, WidgetBuilder> get routes {
    return {
      AppRoutes.login: ((context) => LoginScreen()),
      AppRoutes.splash: ((context) => SplashScreen()),
       AppRoutes.officerdashboard: ((context) => OfficerDashboard()),
          AppRoutes.privacyPolicy: ((context) => PrivacyPolicyView()),
      
    };
  }
}
