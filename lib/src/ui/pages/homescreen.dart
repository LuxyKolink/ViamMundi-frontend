import 'package:flutter/material.dart';

import 'package:viammundi_frontend/src/ui/widgets/appbar.dart';
import 'package:viammundi_frontend/src/ui/widgets/bottom_navbar.dart';
import 'package:viammundi_frontend/src/ui/widgets/button.dart';
import 'package:viammundi_frontend/src/ui/widgets/title_section.dart';

import 'package:viammundi_frontend/src/utils/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          const TitleSection(
            profileImageUrl: AppIcons.profileIcon,
            userName: 'Hola',
            routeName: 'Comidas Rapidas el chamo',
          ),
          Button(onPressed: () {}, text: 'Publicar')
        ],
      ),
      bottomNavigationBar: const BottomNavbar(),
    );
  }
}
