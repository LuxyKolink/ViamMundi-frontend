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
import 'package:viammundi_frontend/shared/resources/colors.dart';

class RouteCarrouselWidget extends StatefulWidget {
  const RouteCarrouselWidget({super.key});

  @override
  State<RouteCarrouselWidget> createState() => _RouteCarrouselWidgetState();
}

class _RouteCarrouselWidgetState extends State<RouteCarrouselWidget> {
  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return PageView(
      controller: controller,
      children: <Widget>[
        Container(
          color: getRandomColor(),
          child: const Center(child: Text('1')),
        ),
        Container(
          color: getRandomColor(),
          child: const Center(child: Text('2')),
        ),
        Container(
          color: getRandomColor(),
          child: const Center(child: Text('3')),
        )
      ],
    );
  }
}
