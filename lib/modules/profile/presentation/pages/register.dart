import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:viammundi_frontend/modules/profile/presentation/bloc/user_state.dart';
import 'package:viammundi_frontend/shared/constants/constants.dart';
import '../../../skeleton/bloc/selected_provider.dart';
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
  late final TextEditingController _emailTextController;
  late final TextEditingController _usernameTextController;
  late final TextEditingController _passwordTextController;

  String? errorMesagge = "";

  Future<void> _register() async {
    final email = _emailTextController.text;
    final username = _usernameTextController.text;
    final password = _passwordTextController.text;

    print(email + username + password);

    try {
      UserState userState = Provider.of<UserState>(context, listen: false);

      print(email + username + password);
      final result =
          await userState.registerProvider(email, username, password);
      //if acá
      if (result) {
        Provider.of<SelectedProvider>(context, listen: false).changePage(0);
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
    _emailTextController = TextEditingController();
    _usernameTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // int selectedPage = Provider.of<SelectedProvider>(context).selectedPage;

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
              Button(text: 'Entrar', onPressed: _register),
              Button(
                text: 'Entrar',
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                  Provider.of<SelectedProvider>(context, listen: false)
                      .changePage(0);
                },
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
