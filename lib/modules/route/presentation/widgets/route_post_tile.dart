import 'package:flutter/material.dart';
import 'package:viammundi_frontend/shared/constants/constants.dart';
import 'package:viammundi_frontend/shared/widgets/circle_avatar.dart';

class RoutePostTile extends StatelessWidget {
  final String profileImageUrl;

  const RoutePostTile({
    super.key,
    required this.profileImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.spacingSmall),
      alignment: Alignment.center,
      child: Row(
        children: [
          const SizedBox(
            width: 30,
            height: 30,
            child: CircleAvatarWidget(),
          ),
          const SizedBox(
            width: AppSpacing.spacingSmall,
          ),
          Expanded(child: Text(profileImageUrl))
        ],
      ),
    );
  }
}
