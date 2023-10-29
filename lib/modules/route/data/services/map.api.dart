import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:math' show cos, sqrt, asin;

import 'package:viammundi_frontend/shared/resources/map.utils.dart';

class MapController extends ChangeNotifier {
  final List<LatLng> pointroutes = [];

  var parar = false;

  getPos(Timer a) async {
    obtenerGps();
    var pos = await Geolocator.getCurrentPosition();

    print('${pos.latitude.toString()}, ${pos.longitude.toString()}');

    if (pointroutes.isEmpty) {
      pointroutes.add(LatLng(pos.latitude, pos.longitude));
    } else {
      LatLng lastPoint = pointroutes.last;
      double distance = Geolocator.distanceBetween(lastPoint.latitude, lastPoint.longitude, pos.latitude, pos.longitude);

      print(distance);

      if (distance >= 1) {
        pointroutes.add(LatLng(pos.latitude, pos.longitude));
      }
      
      if (parar) {
        a.cancel();
      }
    }
  }

  

  suscribePosition() async {
    Timer.periodic(const Duration(seconds: 3), getPos);
  }

  dessuscribePosition() async {
    parar = true;
    notifyListeners();
  }

  final Map<MarkerId, Marker> _markers = {};

  Set<Marker> get markers => _markers.values.toSet();

  final initialCameraPosition =
      const CameraPosition(target: LatLng(8.4787483, -69.9458963), zoom: 14);

  void onTap(LatLng position) {
    final markerId = MarkerId(_markers.length.toString());
    final marker = Marker(markerId: markerId, position: position);
    _markers[markerId] = marker;
    notifyListeners();
  }
}
