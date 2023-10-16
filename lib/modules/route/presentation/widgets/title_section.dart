import 'package:flutter/material.dart';
import 'package:viammundi_frontend/shared/constants/constants.dart';

class TitleSection extends StatelessWidget {
  final String profileImageUrl;
  final String userName;
  final String routeName;

  const TitleSection({
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
          // Columna de la foto de perfil (Círculo)
          Container(
            width: 40.0,
            height: 40.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(
                    profileImageUrl), // Aquí puedes cargar la imagen de perfil
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16.0),

          // Columna del nombre de la ruta (Ocupa más espacio)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                Text(routeName),
              ],
            ),
          ),
          const SizedBox(width: 16.0),

          // Columna del botón de guardar
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () => onSavePressed(context),
          ),
          const SizedBox(width: 16.0),

          // Columna del botón de reportar
          IconButton(
            icon: const Icon(Icons.report),
            onPressed: () => onReportPressed(context),
          ),
        ],
      ),
    );
  }
}
