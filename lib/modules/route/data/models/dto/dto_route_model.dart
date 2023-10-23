// import 'package:flutter/material.dart';

class DTORouteModel {
  int id;
  String userId;
  String mainImage;
  int durationRoute;
  int distanceRoute;
  int priceRoute;
  int likes;

  DTORouteModel({
    required this.id,
    required this.userId,
    required this.mainImage,
    required this.durationRoute,
    required this.distanceRoute,
    required this.priceRoute,
    required this.likes,
  });

  List<DTORouteModel> getDTORouteModel() {
    List<DTORouteModel> routes = [];

    routes.add(DTORouteModel(
      id: 1,
      userId: '1',
      mainImage: mainImage,
      durationRoute: durationRoute,
      distanceRoute: distanceRoute,
      priceRoute: priceRoute,
      likes: likes,
    ));

    routes.add(DTORouteModel(
      id: 2,
      userId: '2',
      mainImage: mainImage,
      durationRoute: durationRoute,
      distanceRoute: distanceRoute,
      priceRoute: priceRoute,
      likes: likes,
    ));

    routes.add(DTORouteModel(
      id: 3,
      userId: '3',
      mainImage: mainImage,
      durationRoute: durationRoute,
      distanceRoute: distanceRoute,
      priceRoute: priceRoute,
      likes: likes,
    ));

    routes.add(DTORouteModel(
      id: 4,
      userId: '4',
      mainImage: mainImage,
      durationRoute: durationRoute,
      distanceRoute: distanceRoute,
      priceRoute: priceRoute,
      likes: likes,
    ));

    routes.add(DTORouteModel(
      id: 5,
      userId: '5',
      mainImage: mainImage,
      durationRoute: durationRoute,
      distanceRoute: distanceRoute,
      priceRoute: priceRoute,
      likes: likes,
    ));

    routes.add(DTORouteModel(
      id: 6,
      userId: '6',
      mainImage: mainImage,
      durationRoute: durationRoute,
      distanceRoute: distanceRoute,
      priceRoute: priceRoute,
      likes: likes,
    ));

    return routes;
  }
}
