import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final bool isTitle;

  const CustomText({
    super.key,
    required this.text,
    this.isTitle = false,
  });

  @override
  Widget build(BuildContext context) {
    // final textStyle = TextStyle(
    //     color: textColor,
    //     fontSize: fontSize,
    //     fontWeight: isBold ? FontWeight.bold : FontWeight.normal);

    // return Text(text /*, style: textStyle*/);
    return Text(
      text,
      // style: TextStyle(
      //   fontSize: fontSize,
      //   fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      // ),
      style: isTitle
          ? Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
              )
          : null /*Theme.of(context).textTheme.bodyMedium */,
    );
  }
}
