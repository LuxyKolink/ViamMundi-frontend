import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:viammundi_frontend/modules/route/presentation/bloc/selected_option_provider.dart';
import 'package:viammundi_frontend/modules/route/presentation/widgets/checkpoint_list_widget.dart';
import 'package:viammundi_frontend/shared/constants/constants.dart';
import 'package:viammundi_frontend/shared/resources/colors.dart';
import 'package:viammundi_frontend/shared/widgets/button.dart';
import 'package:viammundi_frontend/shared/widgets/text.dart';

import '../../../../shared/widgets/icon_button.dart';

class InProgressRoutePage extends StatelessWidget {
  const InProgressRoutePage({super.key});

  @override
  Widget build(BuildContext context) {
    var selectedState = context.watch<SelectedOptionProvider>();

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(AppSpacing.spacingMedium),
            child: Center(
              child: CustomText(
                text: 'Ruta en Curso',
                isTitle: true,
              ),
            ),
          ),
          SizedBox(
            height: 200,
            width: 500,
            child: Image.asset(
              'assets/temp/img1.jpg',
              fit: BoxFit.cover,
            ),
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
                        onPressed: () async {
                          final returnedImage = await ImagePicker()
                              .pickImage(source: ImageSource.camera);
                          if (returnedImage != null) {
                            File imageFile = File(returnedImage.path);
                            selectedState.setImage(imageFile);
                            if (!context.mounted) return;
                            Navigator.pushNamed(context, '/addcheckpoint');
                          }
                        },
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
                        onPressed: () async {
                          final returnedImage = await ImagePicker()
                              .pickImage(source: ImageSource.gallery);
                          if (returnedImage != null) {
                            File imageFile = File(returnedImage.path);
                            selectedState.setImage(imageFile);
                            if (!context.mounted) return;
                            Navigator.pushNamed(context, '/addcheckpoint');
                          }
                        },
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
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.spacingLarge),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(text: 'Checkpoints'),
                SizedBox(height: AppSpacing.spacingSmall),
                SizedBox(
                  height: 150,
                  child: CheckpointListWidget(),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.spacingMedium),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Button(
                  text: 'Publicar',
                  onPressed: () {},
                ),
                Button(
                  text: 'Cancelar',
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
