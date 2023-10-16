import 'package:flutter/material.dart';
import 'package:viammundi_frontend/modules/route/presentation/widgets/route_carrousel.dart';
import 'package:viammundi_frontend/modules/route/presentation/widgets/title_section.dart';
import '../widgets/route_post_tile.dart';
import '../../../../shared/widgets/circle_avatar.dart';
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
          CircleAvatarWidget(),
          RoutePostTile(
            profileImageUrl: 'assets/icons/profile_icon.png',
            userName: 'Diegod',
          ),
          TitleSection(
            profileImageUrl: 'assets/icons/profile_icon.png',
            userName: 'Diegod',
            routeName: 'Comidas Rapidas el chamo',
          ),
          RouteCarrouselWidget()
        ]),
      ),
    );
  }
}
