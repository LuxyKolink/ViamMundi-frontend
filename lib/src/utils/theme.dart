import 'package:flutter/material.dart';
import 'colors.dart';
import 'constants.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      primaryColor: AppColors.primaryColor,
      fontFamily: 'Almarai',
      appBarTheme: const AppBarTheme(
        color: AppColors.primaryColor,
        titleTextStyle:
            TextStyle(color: AppColors.white, fontSize: FontSize.fontSizeLarge),
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
            color: AppColors.primaryColor,
            fontSize: FontSize.fontSizeLarge,
            fontWeight: FontWeight.bold),
      ),
      buttonTheme: const ButtonThemeData(
          buttonColor: AppColors.primaryColor,
          textTheme: ButtonTextTheme.primary));
}
