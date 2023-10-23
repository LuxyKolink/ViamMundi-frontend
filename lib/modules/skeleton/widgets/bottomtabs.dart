import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bloc/selected_provider.dart';
import '../../../shared/resources/colors.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    int selectedPage = Provider.of<SelectedProvider>(context).selectedPage;

    return BottomNavigationBar(
      unselectedItemColor: AppColors.white,
      backgroundColor: AppColors.primaryColor,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      elevation: 0,
      iconSize: 30,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle),
          label: 'Crear',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Perfil',
        ),
      ],
      currentIndex: selectedPage,
      selectedItemColor: AppColors.white,
      onTap: (value) {
        Provider.of<SelectedProvider>(context, listen: false).changePage(value);
      },
    );
  }
}
