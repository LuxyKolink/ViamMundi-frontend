import 'package:flutter/material.dart';
import 'package:viammundi_frontend/shared/constants/constants.dart';
import 'package:viammundi_frontend/shared/widgets/circle_avatar.dart';
import 'package:viammundi_frontend/shared/widgets/textbutton.dart';

import '../../../../shared/widgets/button.dart';
import '../../../../shared/widgets/textfield.dart';

class UserConfigPage extends StatefulWidget {
  const UserConfigPage({super.key});

  @override
  State<UserConfigPage> createState() => _UserConfigPageState();
}

class _UserConfigPageState extends State<UserConfigPage> {
  late final TextEditingController _username;
  late final TextEditingController _description;

  @override
  void initState() {
    _username = TextEditingController();
    _description = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: AppSpacing.spacingLarge),
        const CircleAvatarWidget(),
        CustomTextButton(
          text: 'Editar',
          onPressed: () {},
        ),
        const SizedBox(height: AppSpacing.spacingMedium),
        Padding(
          padding: const EdgeInsets.all(16),
          child: CustomTextField(
            controller: _username,
            labelText: 'Usuario',
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: CustomTextField(
            controller: _description,
            labelText: 'Descripción',
            isDesc: true,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Button(
                text: 'Guardar',
                onPressed: () {},
                width: 100,
              ),
              Button(
                text: 'Cancelar',
                onPressed: () {},
                width: 100,
              ),
            ],
          ),
        ),
        CustomTextButton(
          text: 'Cerrar Sesión',
          onPressed: () {},
        ),
      ],
    );
  }
}
