import 'package:flutter/material.dart';
import 'package:viammundi_frontend/shared/constants/constants.dart';
import '../../../skeleton/widgets/appbar.dart';
import '../../../../shared/widgets/button.dart';
import '../../../../shared/widgets/text.dart';
import '../../../../shared/widgets/textbutton.dart';
import '../../../../shared/widgets/textformfield.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailTextController = TextEditingController();
  final _usernameTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: AppSpacing.spacingLarge,
              ),
              const CustomText(
                text: 'Registro',
                isTitle: true,
              ),
              const SizedBox(
                height: AppSpacing.spacingLarge,
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: CustomTextFormField(
                  controller: _emailTextController,
                  labelText: 'Correo Electrónico',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: CustomTextFormField(
                  controller: _usernameTextController,
                  labelText: 'Nombre de Usuario',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: CustomTextFormField(
                  controller: _passwordTextController,
                  labelText: 'Contraseña',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: CustomTextFormField(
                  controller: _passwordTextController,
                  labelText: 'Confirmar Contraseña',
                ),
              ),
              CustomTextButton(
                text: 'Acepto los terminos y condiciones...(RadioTile)',
                onPressed: () {},
              ),
              Button(
                text: 'Entrar',
                onPressed: () {},
              ),
              // Padding(
              //   padding: const EdgeInsets.all(4),
              //   child: CustomTextButton(
              //     text: 'Regresar',
              //     onPressed: () {
              //       Navigator.pop(context);
              //     },
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
