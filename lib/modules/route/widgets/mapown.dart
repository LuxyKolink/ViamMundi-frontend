import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:viammundi_frontend/modules/route/services/map.api.dart';

class MapOwnState extends StatelessWidget {
  const MapOwnState({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MapController>(
        create: (_) => MapController(),
        child: Consumer<MapController>(
          builder: (_, controller, __) => Column(
            children: [
              Expanded(
                child: GoogleMap(
                  initialCameraPosition: controller.initialCameraPosition,
                  myLocationButtonEnabled: true,
                  mapType: MapType.terrain,
                  markers: controller.markers,
                  polylines: {
                    Polyline(
                        points: controller.pointroutes,
                        polylineId: const PolylineId("ruta cosa"))
                  },
                  //zoomGesturesEnabled: false, gestion de gestos
                  //zoomControlsEnabled: false, control de zoom
                  //compassEnabled: false, esconder compas
                  //onTap: (position){
                  //  print(position);
                  //},
                  onTap: controller.onTap,
                ),
              ),
            ],
          ),
        ));
  }
}

//  final _controller = MapController();
//Column(
//      children: [
//        Expanded(
//          child:  GoogleMap(
//          initialCameraPosition:  _controller.initialCameraPosition, 
//          myLocationButtonEnabled: true,
//          mapType: MapType.terrain, 
//          markers: _controller.markers,
//          //zoomGesturesEnabled: false, gestion de gestos
//          //zoomControlsEnabled: false, control de zoom
//          //compassEnabled: false, esconder compas
//          //onTap: (position){
//          //  print(position);
//          //},
//          onTap: _controller.onTap,
//          ),
//        ),
//      ],
//    );