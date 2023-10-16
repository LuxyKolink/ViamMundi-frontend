import 'package:flutter/material.dart';
import 'package:viammundi_frontend/shared/widgets/circle_avatar.dart';
import '../../../skeleton/widgets/appbar.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
        appBar: CustomAppBar(showTabBar: true),
        body: TabBarView(children: [
          CircleAvatarWidget(),
          Center(
            child: Text("Most close routes"),
          ),
          Center(
            child: Text("Most expensive routes"),
          ),
          Center(
            child: Text("Most short routes"),
          ),
        ]),
      ),
    );
  }
}
