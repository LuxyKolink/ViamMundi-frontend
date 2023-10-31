import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:viammundi_frontend/modules/route/data/models/dto/Route.DTO.dart';
import 'dart:math' show cos, sqrt, asin;

import 'package:viammundi_frontend/shared/resources/map.utils.dart';

class MapController extends ChangeNotifier {
  final List<LatLng> pointroutes = [];
  final Set<Marker> markers = {};
  late CameraPosition cameraPosition;
  late final Marker initialPosition;
  
  Marker? currentMarker;

  //variable para parar tomar los puntos
  var parar = false;

  //funcion tomar puntos
  getPos(Timer a) async {
    obtenerGps();
    var pos = await Geolocator.getCurrentPosition();

    print('${pos.latitude.toString()}, ${pos.longitude.toString()}');

    if (pointroutes.isEmpty) {
      pointroutes.add(LatLng(pos.latitude, pos.longitude));
    } else {
      LatLng lastPoint = pointroutes.last;
      double distance = Geolocator.distanceBetween(
          lastPoint.latitude, lastPoint.longitude, pos.latitude, pos.longitude);

      print(distance);

      if (distance >= 1) {
        pointroutes.add(LatLng(pos.latitude, pos.longitude));
        notifyListeners();
      }

      if (parar) {
        a.cancel();
      }
    }
  }

  //iniciar toma periodica
  suscribePosition() async {
    Timer.periodic(const Duration(seconds: 3), getPos);
  }

  //parar la toma
  dessuscribePosition() async {
    parar = true;
    notifyListeners();
  }

  //obtener la posicion
  getUserLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    cameraPosition = CameraPosition(
      target: LatLng(position.latitude, position.longitude),
      zoom: 16.0, // Puedes ajustar el zoom según tus necesidades
    );
    notifyListeners();
  }

  //añadir un marcador
  addCurrentLocationMarker(String markerIdString) async {
    var pos = await Geolocator.getCurrentPosition();
    final MarkerId markerId = MarkerId(markerIdString);
    final Marker marker = Marker(
      markerId: markerId,
      position: LatLng(pos.latitude, pos.longitude),
      infoWindow: InfoWindow(title: markerIdString),
    );
    print("aqui en curso");
    print(marker);

    markers.add(marker);
    currentMarker = null;
    currentMarker = marker;
    notifyListeners();
  }

  //calcular la distancia total
  double calculateTotalDistance(List<LatLng> pointroutes) {
    double totalDistance = 0;

    for (var i = 0; i < pointroutes.length - 1; i++) {
      var start = pointroutes[i];
      var end = pointroutes[i + 1];

      var distance = Geolocator.distanceBetween(
        start.latitude,
        start.longitude,
        end.latitude,
        end.longitude,
      );

      totalDistance += distance;
    }
     
    print(totalDistance.toString() + "distancia acumulada");
    //acá guardar la distancia total en metros
    return totalDistance;
  }
}
