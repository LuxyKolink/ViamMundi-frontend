import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:viammundi_frontend/modules/route/data/models/dto/CheckPoint.DTO.dart';

class CheckPointProviderCreate extends ChangeNotifier {
  late List<ReqCompleteCheckPointDTO> checkPoints =[];
  late ReqCompleteCheckPointDTO currentCheckpoint =
      ReqCompleteCheckPointDTO.initial();

  late List<File> checkPointsImages =[];
  late File? currentImege;

  setCoordinates(Marker? newMarker) {
    JsonCodec jsonCodec = const JsonCodec();
    var encoded = jsonCodec.encode(newMarker);
    currentCheckpoint.coordinates = encoded;
    notifyListeners();
  }

  void setDescription(String newDescription) {
    currentCheckpoint.description = newDescription;
    notifyListeners();
  }

  void setName(String newName) {
    currentCheckpoint.name = newName;
    notifyListeners();
  }

  void setRouteId(int newRouteId) {
    currentCheckpoint.routeId = newRouteId;
    notifyListeners();
  }

  void setImageList(File newImage) {
    checkPointsImages.add(newImage);
    notifyListeners();
  }

  void setImage(File? newImage) {
    currentImege = newImage;
    notifyListeners();
  }

  void addCheckPoint(ReqCompleteCheckPointDTO newCheckPoint) {
  final clonedCheckPoint = ReqCompleteCheckPointDTO(
    name: newCheckPoint.name,
    description: newCheckPoint.description,
    coordinates: newCheckPoint.coordinates,
    routeId: newCheckPoint.routeId,
  );
  checkPoints.add(clonedCheckPoint);
  notifyListeners();
}
}
