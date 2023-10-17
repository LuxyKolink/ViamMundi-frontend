import 'package:flutter/material.dart';
import 'package:viammundi_frontend/shared/constants/constants.dart';

class RoutePostTile extends StatelessWidget {
  final String profileImageUrl;
  final String userName;

  const RoutePostTile({
    super.key,
    required this.profileImageUrl,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.spacingSmall),
      alignment: Alignment.center,
      child: Row(
        children: [
          SizedBox(
            width: 30,
            height: 30,
            child: CircleAvatar(backgroundImage: AssetImage(profileImageUrl)),
          ),
          const SizedBox(
            width: AppSpacing.spacingSmall,
          ),
          Expanded(child: Text(userName))
        ],
      ),
    );
  }
}
