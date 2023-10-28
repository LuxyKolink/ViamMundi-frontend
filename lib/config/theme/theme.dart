import 'package:flutter/material.dart';
import '../../shared/resources/colors.dart';
import '../../shared/constants/constants.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: AppColors.primaryColor,
      secondary: AppColors.secondaryColor,
    ),
    fontFamily: 'Almarai',
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: FontSize.fontSizeExtraLarge,
        fontWeight: FontWeight.bold,
        fontFamily: 'Ceviche_One',
      ),
      titleMedium: TextStyle(
        fontSize: FontSize.fontSizeSmall,
        fontWeight: FontWeight.bold,
        fontFamily: 'Almarai',
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Almarai',
        fontSize: FontSize.fontSizeSmall,
      ),
    ),
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        color: AppColors.white,
        fontFamily: 'Ceviche_One',
        fontSize: FontSize.fontSizeLarge,
      ),
    ),
    buttonTheme: const ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
    ),
  );
}
