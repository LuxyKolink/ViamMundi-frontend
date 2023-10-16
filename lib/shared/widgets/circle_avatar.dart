import 'package:flutter/material.dart';
import 'package:viammundi_frontend/shared/resources/colors.dart';

class CircleAvatarWidget extends StatelessWidget {
  const CircleAvatarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircleAvatar(
        backgroundColor: AppColors.white,
        radius: 55,
        backgroundImage: AssetImage('assets/icons/profile_icon.png'),
      ),
    );
  }
}
