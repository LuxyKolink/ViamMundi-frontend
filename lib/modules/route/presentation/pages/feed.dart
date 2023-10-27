import 'package:flutter/material.dart';

import '../widgets/route_post.dart';

class FeedContentPage extends StatelessWidget {
  const FeedContentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          RoutePostWidget(),
          RoutePostWidget(),
          RoutePostWidget(),
        ],
      ),
    );
  }
}
