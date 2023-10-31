import 'package:flutter/material.dart';
import 'package:viammundi_frontend/shared/constants/constants.dart';
import 'package:viammundi_frontend/shared/widgets/circle_avatar.dart';

class RoutePostTile extends StatelessWidget {
  final String profileImageUrl;
  final String nameRoute;

  const RoutePostTile({
    super.key,
    required this.profileImageUrl,
    this.nameRoute = "kevi",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.spacingSmall),
      alignment: Alignment.center,
      child: Row(
        children: [
          SizedBox(
            width: 40,
            height: 40,
            child: CircleAvatarWidget(profileImageUrl:profileImageUrl),
          ),
          const SizedBox(
            width: AppSpacing.spacingSmall,
          ),
          Expanded(child: Text(nameRoute))
        ],
      ),
    );
  }
}
