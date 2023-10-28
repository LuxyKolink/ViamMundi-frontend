import 'package:flutter/material.dart';
import 'package:viammundi_frontend/shared/resources/colors.dart';

class OptionSelectIcon extends StatelessWidget {
  final Icon icon;
  final Icon selectedIcon;
  final bool isSelected;
  final Function() onPressed;
  final Color selectedColor;
  final Color color;

  const OptionSelectIcon({
    super.key,
    this.icon = const Icon(Icons.settings_outlined),
    required this.onPressed,
    this.color = Colors.grey,
    this.selectedColor = AppColors.primaryColor,
    this.isSelected = false,
    this.selectedIcon = const Icon(Icons.settings),
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      isSelected: isSelected,
      selectedIcon: selectedIcon,
      onPressed: onPressed,
      color: isSelected ? selectedColor : color,
      icon: icon,
    );
  }
}
