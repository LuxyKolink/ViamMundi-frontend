import 'dart:convert';

import './CheckPoint.DTO.dart';

class CompleteRouteDTO {
  String userID;
  String transportMethod;
  String typeRoute;
  String nameRoute;
  String descriptionRoute;
  int durationRoute;
  int distanceRoute;
  DateTime dateRoute;
  String locationRoute;
  int priceRoute;
  JsonCodec traceRoute;

  CompleteRouteDTO({
    required this.userID,
    required this.transportMethod,
    required this.typeRoute,
    required this.nameRoute,
    required this.descriptionRoute,
    required this.durationRoute,
    required this.distanceRoute,
    required this.dateRoute,
    required this.locationRoute,
    required this.priceRoute,
    required this.traceRoute,
  });

  CompleteRouteDTO.initial()
      : userID = '',
        transportMethod = '',
        typeRoute = '',
        nameRoute = '',
        descriptionRoute = '',
        durationRoute = 0,
        distanceRoute = 0,
        dateRoute = DateTime.now(),
        locationRoute = '',
        priceRoute = 0,
        traceRoute = JsonCodec();

  factory CompleteRouteDTO.fromJson(Map<String, dynamic> json) {
    return CompleteRouteDTO(
      userID: json['user_id'] as String,
      transportMethod: json['transport_method'] as String,
      typeRoute: json['type_route'] as String,
      nameRoute: json['name_route'] as String,
      descriptionRoute: json['description_route'] as String,
      durationRoute: json['duration_route'] as int,
      distanceRoute: json['distance_route'] as int,
      dateRoute: DateTime.parse(json['date_route']),
      locationRoute: json['location_route'] as String,
      priceRoute: json['price_route'] as int,
      traceRoute: json['trace_route'] as JsonCodec,
    );
  }
}

class ResRouteCreateDTO {
  final int id;
  final String userID;
  final int statusCode;
  final String message;

  ResRouteCreateDTO({
    required this.id,
    required this.userID,
    required this.statusCode,
    required this.message,
  });

  factory ResRouteCreateDTO.fromJson(Map<String, dynamic> json) {
    return ResRouteCreateDTO(
      id: json['id'] as int,
      userID: json['user_id'] as String,
      statusCode: json['status_code'] as int,
      message: json['message'] as String,
    );
  }
}

class ResParcialRouteDTO {
  final int id;
  final String userID;
  final int durationRoute;
  final int distanceRoute;
  final int priceRoute;
  final int likes;
  final List<ResParcialCheckPointDTO> listCheckPoints;
  final String nameRoute;

  ResParcialRouteDTO({
    required this.id,
    required this.userID,
    required this.durationRoute,
    required this.distanceRoute,
    required this.priceRoute,
    required this.likes,
    required this.listCheckPoints,
    required this.nameRoute,
  });

  factory ResParcialRouteDTO.fromJson(Map<String, dynamic> json) {
    var list = json['list_checkpoints'] as List;
    List<ResParcialCheckPointDTO> checkPointsList =
        list.map((e) => ResParcialCheckPointDTO.fromJson(e)).toList();

    return ResParcialRouteDTO(
      id: json['id'] as int,
      userID: json['user_id'] as String,
      durationRoute: json['duration_route'] as int,
      distanceRoute: json['distance_route'] as int,
      priceRoute: json['price_route'] as int,
      likes: json['likes'] as int,
      listCheckPoints: checkPointsList,
      nameRoute: json['name_route'] as String,
    );
  }
}

class ResParcialRouteErrDTO {
  final int statusCode;
  final String message;
  final ResParcialRouteDTO? resParcialRoute;

  ResParcialRouteErrDTO({
    required this.statusCode,
    required this.message,
    this.resParcialRoute,
  });

  factory ResParcialRouteErrDTO.fromJson(Map<String, dynamic> json) {
    return ResParcialRouteErrDTO(
      statusCode: json['status_code'] as int,
      message: json['message'] as String,
      resParcialRoute: json['res_parcial_route'] != null
          ? ResParcialRouteDTO.fromJson(json['res_parcial_route'])
          : null,
    );
  }
}

class ResTotalRouteErrDTO {
  final int statusCode;
  final String message;
  final List<ResParcialRouteDTO>? resTotalRoute;

  ResTotalRouteErrDTO({
    required this.statusCode,
    required this.message,
    this.resTotalRoute,
  });

  factory ResTotalRouteErrDTO.fromJson(Map<String, dynamic> json) {
    return ResTotalRouteErrDTO(
      statusCode: json['status_code'] as int,
      message: json['message'] as String,
      resTotalRoute: (json['res_parcial_route'] as List<dynamic>?)
          ?.map((e) => ResParcialRouteDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

