import 'package:flutter/material.dart';
import 'package:viammundi_frontend/shared/widgets/circle_avatar.dart';
import '../../../../shared/widgets/text.dart';
import '../../../../shared/constants/constants.dart';
import '../../../../shared/widgets/button.dart';

class UserInfoWidget extends StatelessWidget {
  final String username;
  final String imageUrl;
  final int followers;
  final int followeds;
  final int routes;
  final String desc;

  const UserInfoWidget(
      {super.key,
      required this.username,
      required this.imageUrl,
      required this.followers,
      required this.followeds,
      required this.routes,
      required this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.spacingMedium),
      child: Row(
        children: [
          /*1*/
          Column(
            children: [
              /*2*/
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: const Expanded(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: CircleAvatarWidget(),
                  ),
                ),
              ),
              Text(username)
            ],
          ),
          Expanded(
            child: Column(
              children: [
                /*3*/
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(AppSpacing.spacingMedium),
                      child: Button(
                        text: 'Seguir',
                        onPressed: () {},
                        width: 75,
                      ),
                    ),
                    const Expanded(
                        child: CustomText(
                      text: 'Hola',
                      fontSize: FontSize.fontSizeSmall,
                    ))
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
