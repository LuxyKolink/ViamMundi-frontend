import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapController extends ChangeNotifier {
  final List<LatLng> pointroutes = List.empty();

  var parar = false;

  getPos(Timer a) async {
    var pos = await Geolocator.getCurrentPosition();
    print('${pos.latitude.toString()}, ${pos.longitude.toString()}');
    //obtener la distancia entre puntos y solo guardar la que supere unos metros especificos desde un punto anterior
    if (parar) {
      a.cancel();
    }
  }

  suscribePosition() async {
    //subscription.cancel();
    Timer.periodic(const Duration(seconds: 3), getPos);
  }

  dessuscribePosition() async {
    //subscription.cancel();
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
