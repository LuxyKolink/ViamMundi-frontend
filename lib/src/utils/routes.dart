import 'package:flutter/material.dart';
import 'package:viammundi_frontend/src/ui/pages/browser.dart';
import 'package:viammundi_frontend/src/ui/pages/create_route.dart';
import 'package:viammundi_frontend/src/ui/pages/feed.dart';
import 'package:viammundi_frontend/src/ui/pages/homescreen.dart';
import 'package:viammundi_frontend/src/ui/pages/login.dart';
import 'package:viammundi_frontend/src/ui/pages/profile.dart';
import 'package:viammundi_frontend/src/ui/pages/register.dart';
import 'package:viammundi_frontend/src/ui/widgets/mapown.dart';

Map<String, WidgetBuilder> getRoutes() {
  return {
    '/home': (context) => const HomeScreen(),
    '/profile': (context) => const ProfilePage(),
    '/browser': (context) => const BrowserPage(),
    '/feed': (context) => const FeedPage(),
    '/createroute': (context) => const CreateRoutePage(),
    '/login': (context) => const LoginPage(),
    '/register': (context) => const RegisterPage(),
    '/map': (context) => const MapOwnState()
  };
}
