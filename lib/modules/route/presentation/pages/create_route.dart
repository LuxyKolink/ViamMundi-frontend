import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:viammundi_frontend/modules/route/presentation/bloc/selected_option_provider.dart';
import 'package:viammundi_frontend/modules/route/presentation/widgets/option_select_icon.dart';
import 'package:viammundi_frontend/shared/constants/constants.dart';
import 'package:viammundi_frontend/shared/resources/colors.dart';
import 'package:viammundi_frontend/shared/widgets/button.dart';
import 'package:viammundi_frontend/shared/widgets/text.dart';

class CreateRoutePage extends StatelessWidget {
  const CreateRoutePage({super.key});

  @override
  Widget build(BuildContext context) {
    var selectedState = context.watch<SelectedOptionProvider>();
    int selectedTransport =
        Provider.of<SelectedOptionProvider>(context).selectedTransport;
    int selectedAmbient =
        Provider.of<SelectedOptionProvider>(context).selectedAmbient;
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
        const Padding(
          padding: EdgeInsets.all(AppSpacing.spacingMedium),
          child: Text('Medio de Transporte'),
        ),
        Padding(
          padding: const EdgeInsets.all(AppSpacing.spacingMedium),
          child: Container(
            decoration: const BoxDecoration(
              border: BorderDirectional(
                bottom: BorderSide(color: AppColors.primaryColor),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OptionSelectIcon(
                  icon: const Icon(Icons.pedal_bike),
                  isSelected: selectedTransport == 1 ? true : false,
                  onPressed: () {
                    Provider.of<SelectedOptionProvider>(context, listen: false)
                        .changeTransport(1);
                  },
                ),
                OptionSelectIcon(
                  isSelected: selectedTransport == 2 ? true : false,
                  onPressed: () {
                    Provider.of<SelectedOptionProvider>(context, listen: false)
                        .changeTransport(2);
                  },
                ),
                OptionSelectIcon(
                  isSelected: selectedTransport == 3 ? true : false,
                  onPressed: () {
                    Provider.of<SelectedOptionProvider>(context, listen: false)
                        .changeTransport(3);
                  },
                ),
                OptionSelectIcon(
                  isSelected: selectedTransport == 4 ? true : false,
                  onPressed: () {
                    Provider.of<SelectedOptionProvider>(context, listen: false)
                        .changeTransport(4);
                  },
                ),
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(AppSpacing.spacingMedium),
          child: Text('Zona'),
        ),
        Padding(
          padding: const EdgeInsets.all(AppSpacing.spacingMedium),
          child: Container(
            decoration: const BoxDecoration(
              border: BorderDirectional(
                bottom: BorderSide(color: AppColors.primaryColor),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OptionSelectIcon(
                  isSelected: selectedAmbient == 1 ? true : false,
                  onPressed: () {
                    Provider.of<SelectedOptionProvider>(context, listen: false)
                        .changeAmbient(1);
                  },
                ),
                OptionSelectIcon(
                  isSelected: selectedAmbient == 2 ? true : false,
                  onPressed: () {
                    Provider.of<SelectedOptionProvider>(context, listen: false)
                        .changeAmbient(2);
                  },
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppSpacing.spacingMedium),
          child: Button(
            text: 'Iniciar',
            onPressed: () {
              Navigator.pushNamed(context, '/progress');
              selectedState.changeAmbient(0);
              selectedState.changeTransport(0);
            },
          ),
        ),
      ],
    );
  }
}
