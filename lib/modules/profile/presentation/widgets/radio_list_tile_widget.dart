import 'package:flutter/material.dart';
import 'package:viammundi_frontend/shared/resources/colors.dart';

class RadioListTileWidget extends StatelessWidget {
  final String title;

  const RadioListTileWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    String currentOption = title;
    return RadioListTile(
      title: Text(
        title,
        style: const TextStyle(color: AppColors.primaryColor),
      ),
      value: currentOption,
      groupValue: currentOption,
      onChanged: (value) {
        currentOption = value.toString();
      },
    );
  }
}

String option = '';
