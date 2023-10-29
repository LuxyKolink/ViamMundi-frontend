import 'package:flutter/material.dart';
import 'package:viammundi_frontend/modules/route/presentation/widgets/route_carrousel.dart';
import 'package:viammundi_frontend/modules/route/presentation/widgets/route_post_tile.dart';
import 'package:viammundi_frontend/modules/route/presentation/widgets/route_stats.dart';

class RoutePostWidget extends StatelessWidget {
  final int likes;
  final int duration;
  final int price;
  final int distance;
  final int comments;

  const RoutePostWidget({
    Key? key,
    required this.likes,
    required this.duration,
    required this.price,
    required this.distance,
    required this.comments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RoutePostTile(
          profileImageUrl: "http://192.168.56.1:4000/images/imgProf/97f11a1f-2ad9-4ec2-98ef-5fa491a46001",
        ),
        RouteCarrouselWidget(),
        RoutePostStats(
          likes: likes,
          duration: duration,
          price: price,
          distance: distance,
          comments: comments,
        )
      ],
    );
  }
}

