import 'package:flutter/material.dart';
import 'package:viammundi_frontend/src/ui/widgets/appbar.dart';
import 'package:viammundi_frontend/src/ui/widgets/button.dart';
import 'package:viammundi_frontend/src/ui/widgets/text.dart';
import 'package:viammundi_frontend/src/ui/widgets/textbutton.dart';
import 'package:viammundi_frontend/src/ui/widgets/textformfield.dart';
import 'package:viammundi_frontend/src/utils/colors.dart';
import 'package:viammundi_frontend/src/utils/constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _userTextController = TextEditingController();
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
                text: 'Login',
                fontSize: FontSize.fontSizeLarge,
                textColor: AppColors.primaryColor,
                isBold: true,
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: CustomTextFormField(
                  controller: _userTextController,
                  labelText: 'Usuario',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: CustomTextFormField(
                  controller: _passwordTextController,
                  labelText: 'Contraseña',
                ),
              ),
              const CustomText(
                text: 'Huella',
                isBold: true,
                fontSize: FontSize.fontSizeLarge,
                textColor: AppColors.primaryColor,
              ),
              Padding(
                padding: const EdgeInsets.all(4),
                child: CustomTextButton(
                  text: 'Registrarse',
                  onPressed: () {
                    Navigator.pushNamed(context, 'register');
                  },
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
