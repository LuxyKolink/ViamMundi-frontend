import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:viammundi_frontend/modules/skeleton/widgets/appbar.dart';

import '../route/presentation/pages/create_route.dart';
import '../route/presentation/pages/feed.dart';
import '../profile/presentation/pages/login.dart';
import '../skeleton/widgets/bottomtabs.dart';
import 'bloc/selected_filter_provider.dart';
import 'bloc/selected_page_provider.dart';

List<Widget> pages = const [
  FeedPage(),
  CreateRoutePage(),
  LoginPage(),
];

class Skeleton extends StatelessWidget {
  const Skeleton({super.key});

  @override
  Widget build(BuildContext context) {
    int selectedPage = Provider.of<SelectedPageProvider>(context).selectedPage;
    int selectedFilter =
        Provider.of<SelectedFilterProvider>(context).selectedFilter;

    if (selectedPage == 0) {
      return DefaultTabController(
        initialIndex: selectedFilter,
        length: 4,
        child: const Scaffold(
          appBar: CustomAppBar(showTabBar: true),
          body: FeedPage(),
          bottomNavigationBar: BottomNavBar(),
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
