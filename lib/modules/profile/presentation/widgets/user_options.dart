import 'package:flutter/material.dart';
import 'package:viammundi_frontend/shared/widgets/icon_button.dart';

class UserOptionsWidget extends StatelessWidget {
  const UserOptionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomIconButton(icon: const Icon(Icons.add_a_photo_outlined), onPressed:() {
          Navigator.pushNamed(context, '/config');
        }, ),
        CustomIconButton(icon: const Icon(Icons.add_a_photo_outlined), onPressed: () {
          Navigator.pushNamed(context, '/bookmarks');
        },),
        CustomIconButton(icon: const Icon(Icons.add_a_photo_outlined), onPressed:() {
          Navigator.pushNamed(context, '/drafts');
        }, ),
      ],
    );
  }
}
