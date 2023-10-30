import 'package:flutter/material.dart';
import 'package:viammundi_frontend/modules/route/presentation/widgets/map.dart';
import 'package:viammundi_frontend/shared/resources/map.utils.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  void initState() {
    obtenerGps();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox( height:180, child: Maps()),
        Text("data")
      ],
    );
  }
}
