import 'package:flutter/material.dart';
import 'package:viammundi_frontend/modules/browser/pages/browser.dart';
import 'package:viammundi_frontend/modules/main.dart';
import 'package:viammundi_frontend/modules/route/pages/create_route.dart';
import 'package:viammundi_frontend/modules/feed/pages/feed.dart';
import 'package:viammundi_frontend/modules/profile/pages/login.dart';
import 'package:viammundi_frontend/modules/profile/pages/profile.dart';
import 'package:viammundi_frontend/modules/profile/pages/register.dart';
import 'package:viammundi_frontend/modules/route/widgets/mapown.dart';

Map<String, WidgetBuilder> getRoutes() {
  return {
    '/': (context) => const Home(),
    '/profile': (context) => const ProfilePage(),
    '/browser': (context) => const BrowserPage(),
    '/feed': (context) => const FeedPage(),
    '/createroute': (context) => const CreateRoutePage(),
    '/login': (context) => const LoginPage(),
    '/register': (context) => const RegisterPage(),
    '/map': (context) => const MapOwnState()
  };
}
