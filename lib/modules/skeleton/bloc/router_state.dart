import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:viammundi_frontend/modules/route/data/models/dto/Route.DTO.dart';
import 'package:viammundi_frontend/modules/route/data/services/route.client.dart';

class RouterState extends ChangeNotifier {
  ResParcialRouteDTO? ruta;
  Exception? error;

  Future<bool> routerProvider(int id) async {
    try {
      final route = await getRoute(id);
      ruta = route.resParcialRoute;
      error = null;
      return true;
    } catch (e) {
      ruta = null;
      error = e as Exception;
      return false;
    }
  }
}
