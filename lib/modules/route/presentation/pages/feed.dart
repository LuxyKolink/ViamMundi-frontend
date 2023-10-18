import 'package:flutter/material.dart';
import 'package:viammundi_frontend/modules/profile/presentation/widgets/user_options.dart';
import 'package:viammundi_frontend/modules/route/presentation/pages/feed_routes.dart';
import 'package:viammundi_frontend/modules/route/presentation/pages/progress_route.dart';
import '../../../../shared/constants/constants.dart';
import '../../../profile/presentation/widgets/user_info.dart';
import '../../../skeleton/widgets/appbar.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
        appBar: CustomAppBar(showTabBar: true),
        body: TabBarView(children: [
          UserInfoWidget(
            username: 'Diegod',
            imageUrl: 'assets/icons/profile_icon.png',
            followers: 10,
            followeds: 10,
            routes: 10,
            desc: AppText.loremIpsum,
          ),
          FeedContentPage(),
          ProgressRoutePage(),
          UserOptionsWidget()
        ]),
      ),
    );
  }
}
