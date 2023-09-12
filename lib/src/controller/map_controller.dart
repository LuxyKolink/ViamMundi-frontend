import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends ChangeNotifier{

  final Map<MarkerId, Marker> _markers = {};

  Set<Marker> get markers => _markers.values.toSet();

  final initialCameraPosition = CameraPosition(target: LatLng(8.4787483,-69.9458963), zoom: 14);

  void onTap (LatLng position){
    final markerId = MarkerId(_markers.length.toString());
    final marker = Marker(markerId: markerId, position:position);
    _markers[markerId] = marker;
    notifyListeners();
  }
}
