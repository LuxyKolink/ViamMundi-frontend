import 'package:flutter/material.dart';

class FilterTapBar extends StatelessWidget {
  const FilterTapBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabBar(tabs: <Widget>[
      Tab(
        icon: Icon(Icons.thumb_up),
      ),
      Tab(
        icon: Icon(Icons.map),
      ),
      Tab(
        icon: Icon(Icons.money),
      ),
      Tab(
        icon: Icon(Icons.timer),
      )
    ]);
  }
}
