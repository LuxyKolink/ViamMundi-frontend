import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:viammundi_frontend/shared/resources/colors.dart';

import '../bloc/selected_provider.dart';

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
      showTabBar ? const Size.fromHeight(100) : const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
          ? TabBar(
              isScrollable: false,
              indicatorColor: AppColors.white,
              labelColor: AppColors.white,
              tabs: const <Widget>[
                Tab(icon: Icon(Icons.thumb_up)),
                Tab(icon: Icon(Icons.map)),
                Tab(icon: Icon(Icons.money)),
                Tab(icon: Icon(Icons.timer))
              ],
              onTap: (value) {
                Provider.of<SelectedProvider>(context, listen: false)
                    .changeFilter(value);
              },
            )
          : null, // Si showTabBar es falso, no muestra TabBar
    );
  }
}
