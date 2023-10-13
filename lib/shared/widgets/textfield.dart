import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool isDesc;

  const CustomTextField(
      {super.key,
      required this.controller,
      required this.labelText,
      this.isDesc = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        contentPadding: isDesc
            ? const EdgeInsets.symmetric(vertical: 20.0)
            : null, // Ajusta la altura del recuadro
        border: const OutlineInputBorder(), // Opcional: personaliza el borde
      ),
    );
  }
}
