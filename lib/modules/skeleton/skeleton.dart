import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:viammundi_frontend/modules/skeleton/widgets/appbar.dart';

import '../route/presentation/pages/create_route.dart';
import '../route/presentation/widgets/tab_bar.dart';
import '../profile/presentation/pages/login.dart';
import '../skeleton/widgets/bottomtabs.dart';
import 'bloc/selected_provider.dart';

List<Widget> pages = const [
  TabBarWidget(),
  CreateRoutePage(),
  LoginPage(),
];

class Skeleton extends StatelessWidget {
  const Skeleton({super.key});

  @override
  Widget build(BuildContext context) {
    int selectedPage = Provider.of<SelectedProvider>(context).selectedPage;
    int selectedFilter = Provider.of<SelectedProvider>(context).selectedFilter;

    if (selectedPage == 0) {
      return DefaultTabController(
        initialIndex: selectedFilter,
        length: 4,
        child: Scaffold(
          appBar: const CustomAppBar(showTabBar: true),
          body: pages[0],
          bottomNavigationBar: const BottomNavBar(),
        ),
      );
    }

    return Scaffold(
      appBar: const CustomAppBar(),
      body: pages[selectedPage],
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
