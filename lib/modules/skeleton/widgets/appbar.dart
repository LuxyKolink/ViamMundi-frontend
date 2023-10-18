import 'package:flutter/material.dart';
import 'package:viammundi_frontend/shared/resources/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showTabBar;
  final bool isButtonDisabled;

  const CustomAppBar({
    super.key,
    this.showTabBar = false,
    this.isButtonDisabled = false,
  });

  @override
  Size get preferredSize =>
      showTabBar ? const Size.fromHeight(100) : const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // backgroundColor: AppColors.primaryColor,
      title: const Text('ViamMundi'),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.add_alert),
          tooltip: 'Tip',
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('This is a snackbar')));
          },
        ),
        IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'Busqueda',
            onPressed: isButtonDisabled
                ? () {
                    null;
                  }
                : () {
                    Navigator.pushNamed(context, '/browser');
                  }),
      ],
      bottom: showTabBar
          ? const TabBar(
            isScrollable: false,
              labelColor: AppColors.white,
              tabs: <Widget>[
                Tab(icon: Icon(Icons.thumb_up)),
                Tab(icon: Icon(Icons.map)),
                Tab(icon: Icon(Icons.money)),
                Tab(icon: Icon(Icons.timer))
              ],
            )
          : null, // Si showTabBar es falso, no muestra TabBar
    );
  }
}
