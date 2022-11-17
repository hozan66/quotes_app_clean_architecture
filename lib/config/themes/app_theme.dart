// Packages
import 'package:flutter/material.dart';

// Core
import '../../core/utils/app_colors.dart';
import '../../core/utils/app_strings.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: AppColors.primary,
    hintColor: AppColors.hint,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: AppStrings.fontFamily,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      color: Colors.transparent,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20.0,
        fontWeight: FontWeight.w500,
      ),
      elevation: 0.0,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: Colors.white,
        height: 1.3,
        fontSize: 22.0,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
