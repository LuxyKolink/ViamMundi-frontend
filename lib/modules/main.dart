import 'package:flutter/material.dart';

import 'package:viammundi_frontend/config/routes/routes.dart';
import 'package:viammundi_frontend/config/theme/theme.dart';

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
