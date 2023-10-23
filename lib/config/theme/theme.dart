import 'package:flutter/material.dart';
import '../../shared/resources/colors.dart';
import '../../shared/constants/constants.dart';

class AppTheme2 {
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

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: AppColors.primaryColor,
    ),
    textTheme: const TextTheme(bodyMedium: TextStyle(fontFamily: 'Almarai')),
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        color: AppColors.primaryColor,
        fontFamily: 'Ceviche_One',
        fontSize: FontSize.fontSizeLarge,
      ),
    ),
  );
}
