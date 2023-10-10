import 'package:flutter/material.dart';
import 'package:viammundi_frontend/src/models/login.model.dart';
import 'package:viammundi_frontend/src/models/token.model.dart';
import 'package:viammundi_frontend/src/models/users.model.dart';
import 'package:viammundi_frontend/src/services/api.client.dart';
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
  late final TextEditingController _username;
  late final TextEditingController _password;
  TokenJWTModel? _tokenJWTModel;

  String? errorMesagge = "";

  Future<void> _login() async {
    final email = _username.text;
    final password = _password.text;

    try {
      final result = await login(email, password);
      print('hola');
      print(result.tokenJWT);
      setState(() {
        _tokenJWTModel = result;
      });
      Navigator.pushNamed(context, '/home');
    } catch (e) {
      setState(() {
        errorMesagge = "credenciales incorrectas";
      });
      // Manejar errores aquí, por ejemplo, mostrar un mensaje de error.
      print('Error al iniciar sesión: $e');
    }
  }

  List<UsersModel> users = [];

  void _getUsers() {
    users = UsersModel.getUsers();
  }

  @override
  void initState() {
    _getUsers();
    _username = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    super.dispose();
  }

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
                  controller: _username,
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
                    Navigator.pushNamed(context, '/register');
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
                child: Button(text: 'Entrar', onPressed: _login),
              ),
              if (_tokenJWTModel == null)
                Padding(
                    padding: const EdgeInsets.all(4),
                    child: Text('$errorMesagge')),
            ],
          ),
        ),
      ),
    );
  }
}
