import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:viammundi_frontend/modules/profile/data/models/token.model.dart';
import 'package:viammundi_frontend/modules/profile/presentation/bloc/user_state.dart';
import 'package:viammundi_frontend/modules/profile/presentation/widgets/user_banner.dart';
import 'package:viammundi_frontend/modules/skeleton/widgets/appbar.dart';

import '../route/presentation/pages/create_route.dart';
import '../route/presentation/widgets/tab_bar.dart';
import '../profile/presentation/pages/login.dart';
import '../skeleton/widgets/bottomtabs.dart';
import 'bloc/selected_provider.dart';

List<Widget> loggedPages = const [
  TabBarWidget(),
  CreateRoutePage(),
  UserBannerWidget(),
];

List<Widget> pages = const [
  TabBarWidget(),
  LoginPage(),
  LoginPage(),
];

class Skeleton extends StatelessWidget {
  const Skeleton({super.key});

  @override
  Widget build(BuildContext context) {
    int selectedPage = Provider.of<SelectedProvider>(context).selectedPage;
    int selectedFilter = Provider.of<SelectedProvider>(context).selectedFilter;
    TokenJWTModel? token = Provider.of<UserState>(context).token;

    if (selectedPage == 0) {
      return DefaultTabController(
        initialIndex: selectedFilter,
        length: 4,
        child: Scaffold(
          appBar: const CustomAppBar(showTabBar: true),
          body: loggedPages[0],
          bottomNavigationBar: const BottomNavBar(),
        ),
      );
    }

    if (token == null) {
      return Scaffold(
      appBar: const CustomAppBar(),
      body: pages[selectedPage],
      bottomNavigationBar: const BottomNavBar(),
    );
    }

    return Scaffold(
      appBar: const CustomAppBar(),
      body: loggedPages[selectedPage],
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
