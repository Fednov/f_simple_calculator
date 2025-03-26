import 'package:f_simple_calculator/core/theme/app_styles.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      primaryColor: Colors.deepOrange,
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      dividerColor: Colors.black,
      iconButtonTheme: const IconButtonThemeData(
        style: AppStyles.iconButtonStyle,
      ),
      tooltipTheme: TooltipThemeData(
        textStyle: AppStyles.tooltipTextStyle.copyWith(
          color: Colors.white,
        ),
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: Colors.white,
        shadowColor: Colors.white,
        surfaceTintColor: Colors.white,
        scrolledUnderElevation: 0,
        actionsIconTheme: IconThemeData(color: Colors.black),
      ),
    );
  }

  static ThemeData dakrTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.teal,
      scaffoldBackgroundColor: Colors.black,
      iconButtonTheme: const IconButtonThemeData(
        style: AppStyles.iconButtonStyle,
      ),
      tooltipTheme: TooltipThemeData(
        textStyle: AppStyles.tooltipTextStyle.copyWith(
          color: Colors.black,
        ),
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: Colors.black,
        surfaceTintColor: Colors.black,
        shadowColor: Colors.black,
      ),
    );
  }
}
