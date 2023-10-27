import 'package:flutter/material.dart';
import 'package:viammundi_frontend/shared/constants/constants.dart';
import 'package:viammundi_frontend/shared/widgets/button.dart';
import 'package:viammundi_frontend/shared/widgets/text.dart';

class CreateRoutePage extends StatelessWidget {
  const CreateRoutePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: AppSpacing.spacingLarge,
        ),
        const Center(
          child: CustomText(
            text: 'Crear Ruta',
            isTitle: true,
          ),
        ),
        const SizedBox(height: AppSpacing.spacingMedium),
        Image.asset(
          'assets/temp/img1.jpg',
          fit: BoxFit.cover,
        ),
        const SizedBox(height: AppSpacing.spacingMedium),
        const CustomText(text: "Hora: 12:30"),
        const SizedBox(height: AppSpacing.spacingExtraLarge),
        Button(
          text: 'Iniciar',
          onPressed: () {
            Navigator.pushNamed(context, 'progress');
          },
        )
      ],
    );
  }
}
