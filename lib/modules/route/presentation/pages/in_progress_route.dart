import 'package:flutter/material.dart';
import 'package:viammundi_frontend/shared/constants/constants.dart';
import 'package:viammundi_frontend/shared/resources/colors.dart';
import 'package:viammundi_frontend/shared/widgets/text.dart';

import '../../../../shared/widgets/icon_button.dart';

class InProgressRoutePage extends StatelessWidget {
  const InProgressRoutePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(AppSpacing.spacingMedium),
            child: Center(
              child: CustomText(text: 'Ruta en Curso', isTitle: true),
            ),
          ),
          Image.asset(
            'assets/temp/img1.jpg',
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.spacingLarge),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(AppSpacing.spacingSmall),
                      child: CustomText(text: 'Tiempo: 12:30'),
                    ),
                    Padding(
                      padding: EdgeInsets.all(AppSpacing.spacingSmall),
                      child: CustomText(text: 'Km: 15'),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(2),
                      ),
                      height: 75,
                      width: 75,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.camera_alt,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: AppSpacing.spacingLarge,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(2),
                      ),
                      height: 75,
                      width: 75,
                      child: CustomIconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(AppSpacing.spacingMedium),
            child: Column(),
          ),
        ],
      ),
    );
  }
}
