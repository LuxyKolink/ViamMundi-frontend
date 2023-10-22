import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:viammundi_frontend/modules/skeleton/bloc/selected_filter_provider.dart';
import 'package:viammundi_frontend/modules/skeleton/bloc/selected_page_provider.dart';
import 'modules/route/data/services/map.api.dart';
import './config/routes/routes.dart';
import './config/theme/theme.dart';

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
          create: (context) => SelectedPageProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SelectedFilterProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MapController(),
        ),
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
