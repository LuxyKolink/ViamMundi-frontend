import 'package:flutter/material.dart';
import 'package:viammundi_frontend/modules/route/presentation/pages/browser.dart';
import 'package:viammundi_frontend/modules/main.dart';
import 'package:viammundi_frontend/modules/route/presentation/pages/create_route.dart';
import 'package:viammundi_frontend/modules/route/presentation/pages/feed.dart';
import 'package:viammundi_frontend/modules/profile/presentation/pages/login.dart';
import 'package:viammundi_frontend/modules/profile/presentation/pages/profile.dart';
import 'package:viammundi_frontend/modules/profile/presentation/pages/register.dart';
import 'package:viammundi_frontend/modules/route/presentation/widgets/mapown.dart';

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
