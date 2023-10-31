import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:viammundi_frontend/modules/route/data/models/dto/Route.DTO.dart';

class RouterProviderCreate extends ChangeNotifier {
  late CompleteRouteDTO rutaCompleta = CompleteRouteDTO.initial();
  late DateTime horaInicial = DateTime.now();

  void changeTransport(String newVal) {
    rutaCompleta.transportMethod = newVal;
    notifyListeners();
  }

  void changeAmbient(String newVal) {
    rutaCompleta.typeRoute = newVal;
    notifyListeners();
  }

  void changeHour(DateTime newVal) {
    horaInicial = newVal;
    notifyListeners();
  }

  void changeHourFinal(int newVal) {
    rutaCompleta.durationRoute = newVal;
    notifyListeners();
  }

  void changeDate(DateTime newVal) {
    rutaCompleta.dateRoute = newVal;
    notifyListeners();
  }

  void changeDescription(String newVal) {
    rutaCompleta.descriptionRoute = newVal;
    notifyListeners();
  }


  void calculateHourDifference(DateTime startTime, DateTime endTime) {
    int differenceInHours = endTime.difference(startTime).inHours;
    rutaCompleta.durationRoute = differenceInHours.abs();
    notifyListeners();
  }

  void changeLocation() {
    rutaCompleta.locationRoute = "Peyecuesta";
    notifyListeners();
  }

  void changeNameRoute(String name) {
    rutaCompleta.nameRoute = name;
    notifyListeners();
  }

  void changePrice(int price) {
    rutaCompleta.priceRoute = price;
    notifyListeners();
  }

  void changeUserId(String userId) {
    rutaCompleta.userID = userId;
    notifyListeners();
  }

  void changeTraceRoute(String traceRoute) {
    rutaCompleta.typeRoute = traceRoute;
    notifyListeners();
  }

  void changeDistanceTotal(double distanceTotal) {
    rutaCompleta.distanceRoute = distanceTotal.toInt();
    notifyListeners();
  }
}
