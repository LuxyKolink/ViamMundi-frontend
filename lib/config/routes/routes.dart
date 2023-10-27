import 'package:flutter/material.dart';
import 'package:viammundi_frontend/modules/profile/presentation/pages/user_bookmarks_page.dart';
import 'package:viammundi_frontend/modules/profile/presentation/pages/user_config_page.dart';
import 'package:viammundi_frontend/modules/profile/presentation/pages/user_drafts_page.dart';
import 'package:viammundi_frontend/modules/route/presentation/pages/browser.dart';
import 'package:viammundi_frontend/modules/main.dart';
import 'package:viammundi_frontend/modules/profile/presentation/pages/register.dart';
import 'package:viammundi_frontend/modules/route/presentation/pages/in_progress_route.dart';
import 'package:viammundi_frontend/modules/route/presentation/widgets/mapown.dart';

Map<String, WidgetBuilder> getRoutes() {
  return {
    /*Routes*/
    '/': (context) => const Home(),
    '/browser': (context) => const BrowserPage(),
    '/progress': (context) => const InProgressRoutePage(),
    '/map': (context) => const MapOwnState(),
    /*Users*/
    '/register': (context) => const RegisterPage(),
    '/config': (context) => const UserConfigPage(),
    '/drafts': (context) => const UserDraftsPage(),
    '/bookmarks': (context) => const UserBookmarksPage()
  };
}
