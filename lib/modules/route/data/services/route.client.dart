import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:viammundi_frontend/modules/route/data/models/dto/Route.DTO.dart';

Future<ResParcialRouteErrDTO> getRoute(int ID) async {
  final url = Uri.http('192.168.1.10:8000', '/routes/findRoute/$ID');
  print(url);
  final response = await http.get(url);
  print(response.body);
  if (response.statusCode == 200) {
    print("correcto");
    return ResParcialRouteErrDTO.fromJson(jsonDecode(response.body));
  } else {
    print("mal");
    throw Exception('Failed to login');
  }
}

Future<ResTotalRouteErrDTO> getAllRoutes() async {
  final url = Uri.http('192.168.1.10:8000', '/routes/allRoutes/all');
  print(url);
  final response = await http.get(url);
  print(response.body);
  if (response.statusCode == 200) {
    return ResTotalRouteErrDTO.fromJson(jsonDecode(response.body));
  } else {
    print("mal");
    throw Exception('Failed to login');
  }
}
