import 'package:flutter/material.dart';
import '../resources/colors.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;

  const CustomTextFormField(
      {super.key, required this.controller, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        fillColor: AppColors.primaryColor.withOpacity(0.8),
        filled: true,
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryColor)),
        labelText: labelText,
      ),
    );
  }
}
