import 'dart:io';

import 'package:flutter/material.dart';
import 'package:viammundi_frontend/modules/route/data/models/dto/CheckPoint.DTO.dart';
import 'package:viammundi_frontend/modules/route/data/services/checkPoint.client.dart';

class CheckPointState extends ChangeNotifier {
  int? idCurrentCheckPoint;
  Exception? error;

  Future<int> getIdCreateCheckpoint(ReqCompleteCheckPointDTO checkPoint) async {
    try {
      print("ESTÄ ACA");
      final route = await setCheckPoint(checkPoint);
      print("BIEN");
      idCurrentCheckPoint = route;
      error = null;
      notifyListeners();
      return route!;
    } catch (e) {
      print("HUBO PROBLEMAS");
      idCurrentCheckPoint = null;
      error = e as Exception;
      notifyListeners();
      return null!;
    }
  }

  Future<bool> getIdCreateFileOfCheckpoint(File file, String nombre) async {
  try {
    print("ESTÁ ACA");
    final route = await sendFile(file, nombre);
    print("BIEN");
    error = null;
    return true;
  } catch (e) {
    print("HUBO PROBLEMAS");

error = e as Exception?;
    return false;
  }
}
  
  }