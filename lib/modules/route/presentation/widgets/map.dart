import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:viammundi_frontend/modules/route/data/services/map.api.dart';

class Maps extends StatefulWidget {
  const Maps({Key? key}) : super(key: key);

  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  late GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    List<LatLng> pointList = Provider.of<MapController>(context).pointroutes;
    CameraPosition cameraInitial = Provider.of<MapController>(context).initialCameraPosition;
    print(cameraInitial);
    print(pointList);
    return FractionallySizedBox(
      widthFactor: 1.0,
       heightFactor: 4,
        child:  GoogleMap(
            initialCameraPosition: cameraInitial,
            //myLocationButtonEnabled: true,
            //mapType: MapType.terrain,
            //markers: _mapController.markers,
            polylines: {
              Polyline(
                  points: pointList,
                  polylineId: const PolylineId("ruta cosa"))
            },
            zoomGesturesEnabled: false,
            zoomControlsEnabled: false,
            //compassEnabled: false, esconder compas
            //onTap: (position){
            //  print(position);
            //},
            //onTap: _mapController.onTap,
          ),
      );
  }
}