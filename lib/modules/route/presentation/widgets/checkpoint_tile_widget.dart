import 'package:flutter/material.dart';
import 'package:viammundi_frontend/shared/resources/colors.dart';

class CheckpointTileWidget extends StatelessWidget {
  final String id;
  final String checkpointName;
  final Function() onTap;

  const CheckpointTileWidget({
    super.key,
    required this.checkpointName,
    required this.id,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(checkpointName),
        tileColor: AppColors.primaryColor,
        onTap: onTap,
        leading: Text(id),
        trailing: const Icon(Icons.delete),
      ),
    );
  }
}
