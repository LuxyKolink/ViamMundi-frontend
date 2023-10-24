import 'package:flutter/material.dart';
import '../../../profile/presentation/pages/user_config_page.dart';
import '../../../profile/presentation/widgets/user_options.dart';
import 'feed_routes.dart';
import 'progress_route.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabBarView(children: [
      UserConfigPage(),
      FeedContentPage(),
      ProgressRoutePage(),
      UserOptionsWidget()
    ]);
  }
}
