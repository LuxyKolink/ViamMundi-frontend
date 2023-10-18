import 'package:flutter/material.dart';
import 'package:viammundi_frontend/modules/route/presentation/pages/feed_routes.dart';
import 'package:viammundi_frontend/modules/route/presentation/pages/progress_route.dart';
import 'package:viammundi_frontend/modules/route/presentation/widgets/route_carrousel.dart';
import '../../../skeleton/widgets/appbar.dart';
import '../widgets/route_post_tile.dart';
import '../widgets/route_stats.dart';

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
          RoutePostStats(
            likes: 10,
            duration: 10,
            price: 10,
            distance: 10,
            comments: 10,
          ),
          FeedContentPage(),
          //RouteCarrouselWidget(),
          ProgressRoutePage(),
          RoutePostTile(
            profileImageUrl: 'assets/icons/profile_icon.png',
            userName: 'Diegod',
          )
        ]),
      ),
    );
  }
}
