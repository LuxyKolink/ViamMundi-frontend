import 'package:flutter/material.dart';
import 'package:viammundi_frontend/src/ui/widgets/appbar.dart';
import 'package:viammundi_frontend/src/ui/widgets/bottom_navbar.dart';
import 'package:viammundi_frontend/src/utils/theme.dart';

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
        bottomNavigationBar: BottomNavbar(),
      ),
    );
  }
}
