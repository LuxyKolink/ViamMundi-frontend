import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:viammundi_frontend/modules/profile/data/models/token.model.dart';
import 'package:viammundi_frontend/modules/profile/presentation/bloc/user_state.dart';
import 'package:viammundi_frontend/shared/constants/constants.dart';
import '../../../../shared/widgets/button.dart';
import '../../../../shared/widgets/text.dart';
import '../../../../shared/widgets/textbutton.dart';
import '../../../../shared/widgets/textformfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  TokenJWTModel? _tokenJWTModel;

  String? errorMesagge = "";

  Future<void> _login() async {
    final email = _email.text;
    final password = _password.text;

    try {
      UserState userState = Provider.of<UserState>(context, listen: false);
      final result = await userState.loginProvider(email, password);

      //if acá
      if (result) {
        Navigator.pushNamed(context, '/');
      } else {
        setState(() {
          errorMesagge = "credenciales incorrectas";
        });
      }
    } catch (e) {
      // Manejar errores aquí, por ejemplo, mostrar un mensaje de error.
      print('Error al iniciar sesión: $e');
    }
  }

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8),
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomText(
              text: 'ViamMundi',
              isTitle: true,
            ),
            const SizedBox(height: AppSpacing.spacingExtraLarge),
            Padding(
              padding: const EdgeInsets.all(16),
              child: CustomTextFormField(
                controller: _email,
                labelText: 'Usuario',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: CustomTextFormField(
                controller: _password,
                labelText: 'Contraseña',
              ),
            ),
            const SizedBox(height: AppSpacing.spacingMedium),
            Padding(
              padding: const EdgeInsets.all(0),
              child: CustomTextButton(
                text: 'Registrarse',
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(0),
              child: CustomTextButton(
                text: 'Recuperar Contraseña',
                onPressed: () {},
              ),
            ),
            const SizedBox(height: AppSpacing.spacingLarge),
            Padding(
              padding: const EdgeInsets.all(0),
              child: Button(text: 'Entrar', onPressed: _login),
            ),
            Padding(
              padding: const EdgeInsets.all(0),
              child: CustomTextButton(
                text: 'Regresar',
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
              ),
            ),
            if (_tokenJWTModel == null) Text('$errorMesagge'),
          ],
        ),
      ),
    );
  }
}
