import 'package:flutter/material.dart';
import '../../../profile/presentation/widgets/user_options.dart';
import '../widgets/map.dart';
import 'feed_routes.dart';
import 'progress_route.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBarView(children: [
      Placeholder(),
      FeedContentPage(),
      ProgressRoutePage(),
      //MapOwnState()
      Maps(),
      //UserOptionsWidget()
    ]);
  }
}
