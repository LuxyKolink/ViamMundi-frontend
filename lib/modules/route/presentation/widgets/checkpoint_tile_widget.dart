import 'dart:io';

import 'package:flutter/material.dart';
import 'package:viammundi_frontend/shared/resources/colors.dart';

class CheckpointTileWidget extends StatelessWidget {
  final String id;
  final String checkpointName;
  final File image;
  final Function() onTap;

  const CheckpointTileWidget({
    super.key,
    required this.checkpointName,
    required this.id,
    required this.onTap,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        textColor: Colors.white,
        title: Text(checkpointName),
        tileColor: AppColors.primaryColor,
        onTap: onTap,
        leading: Image.file(image),
        trailing: const Icon(Icons.delete),
      ),
    );
  }
}
