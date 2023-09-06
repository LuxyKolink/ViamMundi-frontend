import 'package:flutter/material.dart';
import 'package:viammundi_frontend/src/utils/colors.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      unselectedItemColor: AppColors.white,
      backgroundColor: AppColors.primaryColor,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      elevation: 0,
      iconSize: 30,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          label: 'Crear',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Buscar',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: AppColors.white,
      onTap: _onItemTapped,
    );
  }
}
