import 'package:flutter/material.dart';
import 'package:viammundi_frontend/src/ui/pages/homescreen.dart';
import 'package:viammundi_frontend/src/utils/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primaryColor,
      title: const Text('ViamMundi'),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.question_mark),
          tooltip: 'Tip',
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('This is a snackbar')));
          },
        ),
        IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Regresar a la página principal',
          onPressed: () {
            Navigator.push(context, MaterialPageRoute<void>(
              builder: (BuildContext context) {
                return const HomeScreen();
              },
            ));
          },
        ),
      ],
    );
  }
}
