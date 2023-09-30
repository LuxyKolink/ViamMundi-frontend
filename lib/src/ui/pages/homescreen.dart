import 'package:flutter/material.dart';
import 'package:viammundi_frontend/src/ui/pages/browser.dart';
import 'package:viammundi_frontend/src/ui/pages/feed.dart';
import 'package:viammundi_frontend/src/ui/pages/profile.dart';

import 'package:viammundi_frontend/src/ui/widgets/appbar.dart';
import 'package:viammundi_frontend/src/ui/widgets/bottomtabs.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (_selectedIndex) {
      case 0:
        page = const FeedPage();
      case 1:
        page = const BrowserPage();
      case 2:
        page = const ProfilePage();
      default:
        throw UnimplementedError('no widget for $_selectedIndex');
    }

    return Scaffold(
      appBar: const CustomAppBar(),
      body: page,
      bottomNavigationBar: BottomNavBar(
          onItemTapped: _onItemTapped, selectedIndex: _selectedIndex),
    );
  }
}
