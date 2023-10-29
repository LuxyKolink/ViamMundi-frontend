import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final double width;
  final String text;
  final Function() onPressed;

  const Button(
      {super.key,
      this.width = 100,
      required this.text,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
