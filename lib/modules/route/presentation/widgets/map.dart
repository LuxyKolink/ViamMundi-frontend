import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:viammundi_frontend/shared/resources/colors.dart';

import '../bloc/map.api.dart';

class Maps extends StatefulWidget {
  const Maps({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  late GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    List<LatLng> pointList = Provider.of<MapController>(context).pointroutes;
    CameraPosition cameraInitial =
        Provider.of<MapController>(context).cameraPosition;
    Set<Marker> markers = Provider.of<MapController>(context).markers;

    return GoogleMap(
        initialCameraPosition: cameraInitial,
        myLocationButtonEnabled: true,
        //mapType: MapType.terrain,
        //markers: _mapController.markers,
        markers: markers,
        polylines: {
          Polyline(
              points: pointList,
              polylineId: const PolylineId("ruta cosa"),
              color: AppColors.primaryColor)
        },
        zoomGesturesEnabled: true,
        zoomControlsEnabled: true,
        scrollGesturesEnabled: true,
        tiltGesturesEnabled: true,
        cameraTargetBounds: CameraTargetBounds.unbounded,
        gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
          Factory<OneSequenceGestureRecognizer>(
            () => EagerGestureRecognizer(),
          ),
        });
    //compassEnabled: false, esconder compas
    //onTap: (position){
    //  print(position);
    //},
    //onTap: _mapController.onTap,
  }
}
