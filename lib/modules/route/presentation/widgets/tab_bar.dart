import 'package:flutter/material.dart';
import '../pages/feed.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBarView(children: [
      FeedContentPage(),
      FeedContentPage(),
      FeedContentPage(),
      FeedContentPage(),
    ]);
  }
}
