import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:viammundi_frontend/modules/profile/presentation/bloc/user_state.dart';
import 'modules/route/data/services/map.api.dart';
import './config/routes/routes.dart';
import './config/theme/theme.dart';
import 'modules/skeleton/bloc/selected_provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SelectedProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MapController(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserState(),
        )
      ],
      child: MaterialApp(
        title: 'ViaMundi',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        initialRoute: '/',
        routes: getRoutes(),
      ),
    );
  }
}
