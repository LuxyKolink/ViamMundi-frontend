import 'package:flutter/material.dart';

class StepperWidget extends StatefulWidget {
  const StepperWidget({super.key});

  @override
  State<StepperWidget> createState() => _StepperWidgetState();
}

class _StepperWidgetState extends State<StepperWidget> {
  List<Step> stepList() => [
        const Step(
            title: Text('Recuperar contraseña: Paso 1'),
            content: Center(
              child: Text('Recuperar contraseña: Paso 1'),
            )),
        const Step(
            title: Text('Recuperar contraseña: Paso 2'),
            content: Center(
              child: Text('Recuperar contraseña: Paso 2'),
            )),
        const Step(
            title: Text('Recuperar contraseña: Paso 3'),
            content: Center(
              child: Text('Recuperar contraseña: Paso 3'),
            ))
      ];

  @override
  Widget build(BuildContext context) {
    return Stepper(
      steps: stepList(),
      type: StepperType.horizontal,
      elevation: 0,
    );
  }
}
