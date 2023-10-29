import 'package:flutter/material.dart';
import 'package:viammundi_frontend/shared/constants/constants.dart';
import 'package:viammundi_frontend/shared/resources/colors.dart';

import '../../../../shared/widgets/icon_button.dart';

class RoutePostStats extends StatelessWidget {
  final int likes;
  final int distance;
  final int price;
  final int duration;
  final int comments;

  const RoutePostStats(
      {super.key,
      required this.likes,
      required this.distance,
      required this.price,
      required this.duration,
      required this.comments});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
      alignment: Alignment.center,
      child: Row(
        children: [
          Flexible(
            child: Container(
              alignment: Alignment.center,
              color: AppColors.white,
              child: Row(
                children: [
                  CustomIconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.thumb_up_sharp),
                  ),
                  const SizedBox(
                    width: AppSpacing.spacingMedium,
                  ),
                  Text('$likes'),
                  const SizedBox(
                    width: AppSpacing.spacingSmall,
                  )
                ],
              ),
            ),
          ),
          Flexible(
            child: Container(
              alignment: Alignment.center,
              color: AppColors.white,
              child: Row(
                children: [
                  CustomIconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.thumb_up_sharp),
                  ),
                  const SizedBox(
                    width: AppSpacing.spacingMedium,
                  ),
                  Text('$distance'),
                  const SizedBox(
                    width: AppSpacing.spacingSmall,
                  )
                ],
              ),
            ),
          ),
          Flexible(
            child: Container(
              alignment: Alignment.center,
              color: AppColors.white,
              child: Row(
                children: [
                  CustomIconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.thumb_up_sharp),
                  ),
                  const SizedBox(
                    width: AppSpacing.spacingMedium,
                  ),
                  Text('$price'),
                  const SizedBox(
                    width: AppSpacing.spacingSmall,
                  )
                ],
              ),
            ),
          ),
          Flexible(
            child: Container(
              alignment: Alignment.center,
              color: AppColors.white,
              child: Row(
                children: [
                  CustomIconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.thumb_up_sharp),
                  ),
                  const SizedBox(
                    width: AppSpacing.spacingMedium,
                  ),
                  Text('$duration'),
                  const SizedBox(
                    width: AppSpacing.spacingSmall,
                  )
                ],
              ),
            ),
          ),
          Flexible(
            child: Container(
              alignment: Alignment.center,
              color: AppColors.white,
              child: Row(
                children: [
                  CustomIconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.thumb_up_sharp),
                  ),
                  const SizedBox(
                    width: AppSpacing.spacingMedium,
                  ),
                  Text('$comments'),
                  const SizedBox(
                    width: AppSpacing.spacingSmall,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
