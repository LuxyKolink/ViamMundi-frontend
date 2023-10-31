import 'package:flutter/material.dart';
import 'package:viammundi_frontend/modules/route/data/models/dto/CheckPoint.DTO.dart';
import 'package:viammundi_frontend/modules/route/presentation/widgets/route_carrousel.dart';
import 'package:viammundi_frontend/modules/route/presentation/widgets/route_post_tile.dart';
import 'package:viammundi_frontend/modules/route/presentation/widgets/route_stats.dart';

class RoutePostWidgetModifi extends StatelessWidget {
  final int likes;
  final int duration;
  final int price;
  final int distance;
  final int comments;
  final String idUser;
  final String nameRoute;
  final List<ResParcialCheckPointDTO> listCheckpoints;

  const RoutePostWidgetModifi({
    Key? key,
    required this.likes,
    required this.duration,
    required this.price,
    required this.distance,
    required this.comments,
    required this.idUser,
    required this.listCheckpoints,
    required this.nameRoute
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RouteCarrouselWidget(listCheckpoints:listCheckpoints),
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
