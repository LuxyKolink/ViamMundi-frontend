import 'package:flutter/material.dart';
import 'package:viammundi_frontend/shared/resources/colors.dart';

class OptionSelectIcon extends StatelessWidget {
  final Icon icon;
  final Function() onTap;
  final Color color;

  const OptionSelectIcon(
      {super.key,
      required this.icon,
      required this.onTap,
      this.color = Colors.grey});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        runSpacing: 10,
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: InkWell(
              onTap: onTap,
              autofocus: true,
              focusColor: AppColors.primaryColor,
              child: icon,
            ),
          ),
        ],
      ),
    );
  }
}
