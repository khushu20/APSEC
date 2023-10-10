import 'package:flutter/material.dart';

class AppColors {
  static const Color appThemeColor = const Color(0xFF1950A3);
  static const Color start = const Color(0xFF31488B);
  static const Color middle = const Color(0xFF223662);
   static const Color end = const Color(0xFF09101E);
  
  static const Color white = const Color(0xFFFFFFFF);
  static const Color footerColor = const Color(0xFF1981E0);
  static const Color black = Color.fromARGB(255, 11, 11, 12);
  static const Color gray = const Color(0xFF767676);
  static const Color red = const Color(0xFFD42C39);
  static const Color maroon = Color.fromARGB(255, 178, 27, 16);
  static const Color green = Color.fromARGB(255, 9, 84, 39);
  //static const Color appbarcolor = const Color(0xFF51696B);
  static const Color ash = const Color(0xFF51696B);
    static const Color appbarcolor = const Color(0xFF00BCAA);
  static const Color bgcolor = Color.fromARGB(221, 200, 204, 232);
  static const Color buttoncolor = const Color(0xFF4358AC);
 // static const Color btngreen = const Color(0xFF629b58);
 static const Color btngreen = const Color(0xFF51696B);
    static const Color btnpink = const Color(0xFFb73766);
      static const Color btnblue = const Color(0xFF1b6aaa);
        static const Color purple = const Color(0xFFA355A2);
      
   static const LinearGradient reusableGradient = LinearGradient(
  colors: [  const Color.fromARGB(255, 41, 81, 202), AppColors.middle, AppColors.end],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

static const LinearGradient sampleGradient = LinearGradient(
  colors: [ AppColors.end,AppColors.start],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

  
}
