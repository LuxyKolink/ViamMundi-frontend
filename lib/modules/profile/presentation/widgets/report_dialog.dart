import 'package:flutter/material.dart';

import '../../../../shared/widgets/icon_button.dart';

class ReportDialogWidget extends StatelessWidget {
  const ReportDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
        onPressed: () {
          _dialogBuilder(context);
        },
        icon: const Icon(Icons.report_gmailerrorred_outlined));
  }
}

Future<void> _dialogBuilder(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Reporte'),
        content: const Text('Aquí va una lista de opciones de reporte.'),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Disable'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Enable'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
