import 'package:flutter/material.dart';
import 'package:viammundi_frontend/modules/profile/presentation/widgets/user_info.dart';
import 'package:viammundi_frontend/modules/profile/presentation/widgets/user_options.dart';

import '../../../../shared/constants/constants.dart';
import '../../../route/presentation/widgets/route_post.dart';

class UserBannerWidget extends StatelessWidget {
  const UserBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          UserInfoWidget(
            username: 'Diegod',
            imageUrl: 'assets/icons/profile_icon.png',
            followers: 10,
            followeds: 10,
            routes: 10,
            desc: AppText.loremIpsum,
          ),
          UserOptionsWidget(),
          //RoutePostWidget(),
          //RoutePostWidget(),
          //RoutePostWidget(),
        ],
      ),
    );
  }
}
