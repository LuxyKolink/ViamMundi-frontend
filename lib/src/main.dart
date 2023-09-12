import 'package:flutter/material.dart';
import 'package:viammundi_frontend/src/ui/widgets/mapown.dart';

void main() {
  runApp( MapOwnState());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}

