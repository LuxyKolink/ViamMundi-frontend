import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:viammundi_frontend/modules/route/data/models/dto/Route.DTO.dart';

class RouterProviderCreate extends ChangeNotifier {
  late CompleteRouteDTO rutaCompleta = CompleteRouteDTO.initial();
  late DateTime horaInicial = DateTime.now();

    reset() {
    rutaCompleta = CompleteRouteDTO.initial();
    notifyListeners();
  }

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
    rutaCompleta.traceRoute = traceRoute;
    notifyListeners();
  }

  void changeDistanceTotal(double distanceTotal) {
    rutaCompleta.distanceRoute = distanceTotal.toInt();
    notifyListeners();
  }

  void changeIdUser(String idUser) {
    rutaCompleta.userID = idUser;
    notifyListeners();
  }

  void changeName(String name) {
    rutaCompleta.nameRoute = name;
    notifyListeners();
  }

  void changeDesc(String descrip) {
    rutaCompleta.descriptionRoute = descrip;
    notifyListeners();
  }

  void changePric(int price) {
    rutaCompleta.priceRoute = price;
    notifyListeners();
  }
}
