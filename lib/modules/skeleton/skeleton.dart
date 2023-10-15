import 'package:flutter/material.dart';
import '../route/presentation/pages/create_route.dart';
import '../feed/pages/feed.dart';
import '../profile/presentation/pages/login.dart';
import '../skeleton/widgets/bottomtabs.dart';

class Skeleton extends StatefulWidget {
  const Skeleton({super.key});

  @override
  State<Skeleton> createState() => _SkeletonState();
}

class _SkeletonState extends State<Skeleton> {
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
