// Primero:

// SafeArea( <--- Se lo dejo de tarea

//   child: PageView ( <--- Este es el Widget que le recomiendo

//     controller: _controladorPageView, <--- ...no olvide que requiere un Controlador

//     scrollDirection: Axis.horizontal, <--- ...la orientación

//     children: <Widget>[

//       ... <--- ...los widgets y eso

//     ]

//   )

// )

import 'package:flutter/material.dart';
import 'package:viammundi_frontend/modules/route/data/models/dto/CheckPoint.DTO.dart';
import 'package:viammundi_frontend/shared/resources/colors.dart';

class RouteCarrouselWidget extends StatefulWidget {
    final List<ResParcialCheckPointDTO> listCheckpoints;
  const RouteCarrouselWidget({
    super.key,
    required this.listCheckpoints,
  });

  @override
  State<RouteCarrouselWidget> createState() => _RouteCarrouselWidgetState();
}

class _RouteCarrouselWidgetState extends State<RouteCarrouselWidget> {


  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: PageView(
        scrollBehavior: const MaterialScrollBehavior(),
        controller: controller,
        children: widget.listCheckpoints.map((checkpoint) {
          var stringid = checkpoint.id;
          return Image.network(
            "http://192.168.1.10:8000/checkpoint/streamFile/$stringid",
            fit: BoxFit.cover,
          );
        }).toList(),
        // children: <Widget>[
        //   Image.asset(
        //     'assets/temp/img1.jpg',
        //     fit: BoxFit.cover,
        //   ),
        //   Image.asset(
        //     'assets/temp/img1.jpg',
        //     fit: BoxFit.cover,
        //   ),
        // ],
      ),
    );
  }
}
