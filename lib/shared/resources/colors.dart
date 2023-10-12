import 'package:flutter/material.dart';
import 'dart:math';

class AppColors {
  static const black = Color(0x00000000);
  static const white = Color(0xFFFFFFFF);
  static const primaryColor = Color(0xFF5AD2F6);
  static const secondaryColor = Color(0xFF2E6576);
  static const accentColor = Color(0xFF6BA2B3);
  static const complementary1 = Color(0xFF333333);
  static const complementary2 = Color(0xFF122A31);
}

Color getRandomColor() {
  final random = Random();
  final r = random.nextInt(256);
  final g = random.nextInt(256);
  final b = random.nextInt(256);

  return Color.fromARGB(255, r, g, b);
}
