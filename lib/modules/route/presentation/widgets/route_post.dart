import 'package:flutter/material.dart';
import 'package:viammundi_frontend/modules/route/presentation/widgets/route_carrousel.dart';
import 'package:viammundi_frontend/modules/route/presentation/widgets/route_post_tile.dart';
import 'package:viammundi_frontend/modules/route/presentation/widgets/route_stats.dart';

class RoutePostWidget extends StatelessWidget {
  const RoutePostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        RoutePostTile(
          profileImageUrl: 'assets/icons/profile_icon.png',
          userName: 'Diegod',
        ),
        RouteCarrouselWidget(),
        RoutePostStats(
          likes: 10,
          duration: 10,
          price: 10,
          distance: 10,
          comments: 10,
        )
      ],
    );
  }
}
