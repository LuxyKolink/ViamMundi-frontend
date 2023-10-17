import 'package:flutter/material.dart';
// import 'package:viammundi_frontend/shared/resources/colors.dart';

class CustomIconButton extends StatelessWidget {
  final Icon icon;
  final Function() onPressed;
  const CustomIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 15,
      height: 40,
      child: IconButton(
        iconSize: 20.0,
        color: Colors.grey[300],
        onPressed: onPressed,
        icon: icon,
      ),
    );
  }
}
