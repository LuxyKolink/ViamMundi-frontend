import 'package:flutter/material.dart';
import '../../../../shared/widgets/circle_avatar.dart';
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
          Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: const SizedBox(
                  width: 60,
                  height: 60,
                  child: CircleAvatarWidget(),
                ),
              ),
              CustomText(
                text: username,
                isBold: true,
              )
            ],
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.spacingMedium),
                      child: Button(
                        text: 'Seguir',
                        onPressed: () {},
                        width: 75,
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(
                                    AppSpacing.spacingExtraSmall),
                                child: CustomText(
                                    text: '$followers',
                                    fontSize: FontSize.fontSizeSmall),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(
                                    AppSpacing.spacingExtraSmall),
                                child: CustomText(
                                    text: 'Seguidores',
                                    fontSize: FontSize.fontSizeSmall),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(
                                    AppSpacing.spacingExtraSmall),
                                child: CustomText(
                                    text: '$followeds',
                                    fontSize: FontSize.fontSizeSmall),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(
                                    AppSpacing.spacingExtraSmall),
                                child: CustomText(
                                    text: 'Seguidos',
                                    fontSize: FontSize.fontSizeSmall),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(
                                    AppSpacing.spacingExtraSmall),
                                child: CustomText(
                                    text: '$routes',
                                    fontSize: FontSize.fontSizeSmall),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(
                                    AppSpacing.spacingExtraSmall),
                                child: CustomText(
                                    text: 'Rutas',
                                    fontSize: FontSize.fontSizeSmall),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.spacingMedium,
                      vertical: AppSpacing.spacingSmall),
                  child: const CustomText(
                      text: AppText.loremIpsum,
                      fontSize: FontSize.fontSizeSmall),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
