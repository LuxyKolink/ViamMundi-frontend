import 'package:flutter/material.dart';

import 'package:viammundi_frontend/src/utils/routes.dart';
import 'package:viammundi_frontend/src/utils/theme.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ViaMundi',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: '/home',
      routes: getRoutes(),
    );
  }
}
