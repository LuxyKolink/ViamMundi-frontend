import 'package:flutter/material.dart';
import 'package:viammundi_frontend/shared/constants/constants.dart';
import 'package:viammundi_frontend/shared/widgets/circle_avatar.dart';

class CompleteRouteTitleSection extends StatelessWidget {
  final String profileImageUrl;
  final String userName;
  final String routeName;

  const CompleteRouteTitleSection({
    super.key,
    required this.profileImageUrl,
    required this.userName,
    required this.routeName,
  });

  void onSavePressed(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Los datos se han guardado correctamente.'),
      ),
    );
  }

  void onReportPressed(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Ruta reportada.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.spacingMedium),
      child: Row(
        children: [
          const CircleAvatarWidget(),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  routeName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                Text(userName),
              ],
            ),
          ),
          const SizedBox(width: 16.0),
          IconButton(
            icon: const Icon(Icons.bookmark),
            onPressed: () => onSavePressed(context),
          ),
          const SizedBox(width: 16.0),
          IconButton(
            icon: const Icon(Icons.report),
            onPressed: () => onReportPressed(context),
          ),
        ],
      ),
    );
  }
}
