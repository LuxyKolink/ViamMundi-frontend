import 'package:flutter/material.dart';
import 'package:viammundi_frontend/shared/resources/colors.dart';
import 'package:viammundi_frontend/shared/constants/constants.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color textColor;
  final bool isBold;
  final double fontSize;

  const CustomText(
      {super.key,
      required this.text,
      this.textColor = AppColors.black,
      this.isBold = false,
      this.fontSize = FontSize.fontSizeMedium});

  @override
  Widget build(BuildContext context) {
    // final textStyle = TextStyle(
    //     color: textColor,
    //     fontSize: fontSize,
    //     fontWeight: isBold ? FontWeight.bold : FontWeight.normal);

    // return Text(text /*, style: textStyle*/);
    return Text(
      text,
      style: TextStyle(
          fontSize: fontSize,
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
    );
  }
}
