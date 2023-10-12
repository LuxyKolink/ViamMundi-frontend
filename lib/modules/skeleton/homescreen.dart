import 'package:flutter/material.dart';
import 'package:viammundi_frontend/modules/route/pages/create_route.dart';
import 'package:viammundi_frontend/modules/feed/pages/feed.dart';
import 'package:viammundi_frontend/modules/profile/pages/login.dart';
import '../skeleton/widgets/bottomtabs.dart';

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
        page = const CreateRoutePage();
      case 2:
        // page = const ProfilePage();
        page = const LoginPage();
      default:
        throw UnimplementedError('no widget for $_selectedIndex');
    }

    return Scaffold(
      body: page,
      bottomNavigationBar: BottomNavBar(
          onItemTapped: _onItemTapped, selectedIndex: _selectedIndex),
    );
  }
}
