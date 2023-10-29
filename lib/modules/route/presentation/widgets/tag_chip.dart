import 'package:flutter/material.dart';

import '../../../../shared/resources/colors.dart';

class TagChip extends StatelessWidget {
  final String text;
  final Function() onTap;

  const TagChip({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        runSpacing: 10,
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: InkWell(
              onTap: onTap,
              child: const Icon(Icons.delete),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(text),
          ),
        ],
      ),
    );
  }
}
