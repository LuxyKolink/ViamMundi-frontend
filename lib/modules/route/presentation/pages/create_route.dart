import 'package:flutter/material.dart';
import 'package:viammundi_frontend/modules/route/presentation/widgets/option_select_icon.dart';
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
        const SizedBox(height: AppSpacing.spacingLarge),
        const CustomText(text: "Hora: 12:30"),
        const SizedBox(height: AppSpacing.spacingLarge),
        Padding(
          padding: const EdgeInsets.all(AppSpacing.spacingMedium),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OptionSelectIcon(
                icon: const Icon(Icons.pedal_bike, color: Colors.grey),
                onTap: () {},
              ),
              OptionSelectIcon(
                icon: const Icon(Icons.car_crash, color: Colors.grey),
                onTap: () {},
              ),
              OptionSelectIcon(
                icon: const Icon(Icons.motorcycle, color: Colors.grey),
                onTap: () {},
              ),
              OptionSelectIcon(
                icon: const Icon(Icons.directions_walk, color: Colors.grey),
                onTap: () {},
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppSpacing.spacingMedium),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OptionSelectIcon(
                icon: const Icon(Icons.location_city, color: Colors.grey),
                onTap: () {},
              ),
              OptionSelectIcon(
                icon: const Icon(Icons.location_city, color: Colors.grey),
                onTap: () {},
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppSpacing.spacingMedium),
          child: Button(
            text: 'Iniciar',
            onPressed: () {
              Navigator.pushNamed(context, '/progress');
            },
          ),
        ),
      ],
    );
  }
}
