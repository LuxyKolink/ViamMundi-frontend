import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:viammundi_frontend/modules/route/presentation/bloc/checkpoint_provider_create.dart';
import 'package:viammundi_frontend/modules/route/presentation/widgets/checkpoint_tile_widget.dart';
import 'package:viammundi_frontend/shared/constants/constants.dart';

class CheckpointListWidget extends StatelessWidget {
  const CheckpointListWidget({super.key});

  @override
  Widget build(BuildContext context) {

 var checkPoints = Provider.of<CheckPointProviderCreate>(context).checkPoints;
 var Images = Provider.of<CheckPointProviderCreate>(context).checkPointsImages;

    return ListView.separated(
      itemCount: checkPoints.length,
      padding: const EdgeInsets.all(AppSpacing.spacingSmall),
      itemBuilder: (BuildContext context, int index) {
        return CheckpointTileWidget(
          checkpointName: checkPoints[index].name,
          id: (index+1).toString(),
          onTap: () {},
          image: Images[index],
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
