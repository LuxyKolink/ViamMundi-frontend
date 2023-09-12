import 'package:flutter/material.dart';
import 'package:viammundi_frontend/src/ui/pages/browser.dart';
import 'package:viammundi_frontend/src/ui/pages/homescreen.dart';
import 'package:viammundi_frontend/src/ui/pages/profile.dart';

Map<String, WidgetBuilder> getRoutes() {
  return {
    '/home': (context) => const HomeScreen(),
    '/profile': (context) => const ProfilePage(),
    '/browser': (context) => const BrowserPage()
  };
}
