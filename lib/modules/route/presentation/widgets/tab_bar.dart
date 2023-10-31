import 'package:flutter/material.dart';
import 'package:viammundi_frontend/modules/route/presentation/pages/complete_route.dart';
import 'package:viammundi_frontend/modules/route/presentation/pages/prueba.dart';
import 'package:viammundi_frontend/modules/route/presentation/pages/route_resume.dart';
import '../pages/feed.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBarView(children: [
      FeedContentPage(),
      FeedContentPage(),
      const CompleteRoutePage(),
      const RouteResumePage(),
    ]);
  }
}
