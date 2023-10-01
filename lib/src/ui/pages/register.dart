import 'package:flutter/material.dart';
import 'package:viammundi_frontend/src/ui/widgets/appbar.dart';
import 'package:viammundi_frontend/src/ui/widgets/button.dart';
import 'package:viammundi_frontend/src/ui/widgets/text.dart';
import 'package:viammundi_frontend/src/ui/widgets/textbutton.dart';
import 'package:viammundi_frontend/src/ui/widgets/textformfield.dart';
import 'package:viammundi_frontend/src/utils/colors.dart';
import 'package:viammundi_frontend/src/utils/constants.dart';

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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomText(
                text: 'Register',
                fontSize: FontSize.fontSizeLarge,
                textColor: AppColors.primaryColor,
                isBold: true,
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: CustomTextFormField(
                  controller: _emailTextController,
                  labelText: 'Usuario',
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
              Padding(
                padding: const EdgeInsets.all(4),
                child: CustomTextButton(
                  text: 'Acepto los terminos y condiciones...(RadioTile)',
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4),
                child: CustomTextButton(
                  text: 'Recuperar Contraseña',
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4),
                child: Button(
                  text: 'Entrar',
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4),
                child: CustomTextButton(
                  text: 'Regresar',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
