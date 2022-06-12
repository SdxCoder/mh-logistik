import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color.fromARGB(255, 230, 6, 6);
  static const Color borderColor = Color(0xffEEEEEE);
  static const Color backgroundColor = Color(0xffFAFAFA);
  static const Color textBlackColor = Color(0xff170D2F);
  static const Color textGrayColor = Color(0xff868B9F);


  static ThemeData lightTheme() {
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      iconTheme: const IconThemeData(color: primaryColor),
      primaryColor: primaryColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      indicatorColor: primaryColor,
      splashColor: Colors.white24,
      splashFactory: InkRipple.splashFactory,
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: primaryColor
      ),
      canvasColor: Colors.white,  
      backgroundColor: Colors.white,
      scaffoldBackgroundColor: Colors.white
    );
  }
}
