import 'package:flutter/material.dart';
import '../../skeleton/widgets/appbar.dart';

class BrowserPage extends StatelessWidget {
  const BrowserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: Text('Buscador'),
      ),
    );
  }
}
