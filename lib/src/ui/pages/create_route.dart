import 'package:flutter/material.dart';
import 'package:viammundi_frontend/src/ui/widgets/appbar.dart';

class CreateRoutePage extends StatelessWidget {
  const CreateRoutePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: Text('Route Creation'),
      ),
    );
  }
}
