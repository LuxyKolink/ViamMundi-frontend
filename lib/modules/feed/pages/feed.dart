import 'package:flutter/material.dart';
import '../../skeleton/widgets/appbar.dart';

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
          Center(
            child: Text("Most liked routes"),
          ),
          Center(
            child: Text("Most close routes"),
          ),
          Center(
            child: Text("Most expensive routes"),
          ),
          Center(
            child: Text("Most short routes"),
          )
        ]),
      ),
    );
  }
}
