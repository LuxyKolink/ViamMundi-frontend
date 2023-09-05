import 'package:flutter/material.dart';

import 'package:viammundi_frontend/src/ui/widgets/appbar.dart';
import 'package:viammundi_frontend/src/ui/widgets/bottom_navbar.dart';
import 'package:viammundi_frontend/src/ui/widgets/title_section.dart';

import 'package:viammundi_frontend/src/utils/theme.dart';
import 'package:viammundi_frontend/src/utils/constants.dart';

void main() => runApp(const HomeScreen());

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const Scaffold(
        appBar: CustomAppBar(),
        body: Column(
          children: [
            TitleSection(
              profileImageUrl: AppIcons.profileIcon,
              userName: 'Hola',
              routeName: 'Comidas Rapidas el chamo',
            ),
          ],
        ),
        bottomNavigationBar: BottomNavbar(),
      ),
    );
  }
}
