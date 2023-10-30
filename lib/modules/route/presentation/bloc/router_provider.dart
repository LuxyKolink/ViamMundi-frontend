import 'package:flutter/material.dart';
import 'package:viammundi_frontend/modules/route/data/models/dto/Route.DTO.dart';
import 'package:viammundi_frontend/modules/route/data/services/route.client.dart';

class RouterState extends ChangeNotifier {
  ResParcialRouteDTO? routeParcial;
  List<ResParcialRouteDTO>? rutasTotales;
  Exception? error;

  Future<bool> getRouteProvider(int id) async {
    try {
      final route = await getRoute(id);
      routeParcial = route.resParcialRoute;
      error = null;
      notifyListeners();
      return true;
    } catch (e) {
      routeParcial = null;
      error = e as Exception;
      notifyListeners();
      return false;
    }
  }

  Future<List<ResParcialRouteDTO>?> getAllRoutesProvider() async {
    try {
      print("entro");
      final route = await getAllRoutes();
      print("salio");
      rutasTotales = route.resTotalRoute;
      error = null;
      notifyListeners();
      return rutasTotales;
    } catch (e) {
      print("hubo un error");
      routeParcial = null;
      error = e as Exception;
      notifyListeners();
      return null;
    }
  }
}

