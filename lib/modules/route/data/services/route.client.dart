import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:viammundi_frontend/modules/route/data/models/dto/Route.DTO.dart';

Future<ResParcialRouteErrDTO> getRoute(int ID) async {
  final url = Uri.http('10.153.62.14:8000', '/routes/findRoute/$ID');
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
