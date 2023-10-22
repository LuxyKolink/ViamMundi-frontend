import 'package:flutter/material.dart';
import '../resources/colors.dart';

class CircleAvatarWidget extends StatelessWidget {
  final String assetImage;
  const CircleAvatarWidget({
    super.key,
    this.assetImage = 'assets/icons/profile_icon.png',
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircleAvatar(
        backgroundColor: AppColors.white,
        radius: 55,
        backgroundImage: AssetImage(assetImage),
      ),
    );
  }
}
