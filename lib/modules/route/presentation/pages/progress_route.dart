import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:viammundi_frontend/modules/route/presentation/bloc/map.api.dart';
import 'package:viammundi_frontend/shared/widgets/button.dart';

class ProgressRoutePage extends StatefulWidget {
  const ProgressRoutePage({super.key});

  @override
  State<ProgressRoutePage> createState() => _ProgressRoutePageState();
}

class _ProgressRoutePageState extends State<ProgressRoutePage> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MapController>();
    return Center(
      child: Column(
        children: [
          Button(
            text: "inciar toma de datos",
            onPressed: () {
              appState.suscribePosition();
            },
          ),
          Button(
            text: "parar toma de datos",
            onPressed: () {
              appState.dessuscribePosition();
            },
          ),
        ],
      ),
    );
  }
}
