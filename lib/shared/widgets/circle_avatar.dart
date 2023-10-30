import 'package:flutter/material.dart';
import '../resources/colors.dart';

class CircleAvatarWidget extends StatelessWidget {
  final String profileImageUrl;
  const CircleAvatarWidget({
    super.key,
    this.profileImageUrl = 'assets/icons/profile_icon.png',
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircleAvatar(
        //backgroundColor: Color.fromARGB(0, 28, 203, 142),
        //radius: 55,
        
        backgroundImage: NetworkImage(profileImageUrl)
            // ? NetworkImage(profileImageUrl!)
            // : const AssetImage('assets/icons/profile_icon.png'),
      ),
    );
  }
}
