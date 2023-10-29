import 'package:flutter/material.dart';
import 'package:viammundi_frontend/modules/route/presentation/widgets/checkpoint_tile_widget.dart';
import 'package:viammundi_frontend/shared/constants/constants.dart';

class CheckpointListWidget extends StatelessWidget {
  const CheckpointListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 5,
      padding: const EdgeInsets.all(AppSpacing.spacingSmall),
      itemBuilder: (BuildContext context, int index) {
        return CheckpointTileWidget(
          checkpointName: 'Comidas Rapidas el Chamo',
          id: '1',
          onTap: () {},
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: AppSpacing.spacingSmall,
        );
      },
    );
  }
}
