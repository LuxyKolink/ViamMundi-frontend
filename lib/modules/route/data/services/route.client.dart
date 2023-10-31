import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
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
  print(response.body + "está por acá");
  print(response.statusCode);
  if (response.statusCode == 200) {
    print("ta BIEN");
    var json = ResTotalRouteErrDTO.fromJson(jsonDecode(response.body));
    print(json);
    return json;
  } else {
    print("mal");
    throw Exception('Failed to login');
  }
}

Future<int> createRoute(CompleteRouteDTO ruta) async {
  final url = Uri.http('192.168.1.10:8000', '/routes/createRoute');

  final bodyR = CompleteRouteDTO(
      userID: ruta.userID,
      transportMethod: ruta.transportMethod,
      typeRoute: ruta.typeRoute,
      nameRoute: ruta.nameRoute,
      descriptionRoute: ruta.descriptionRoute,
      durationRoute: ruta.durationRoute,
      distanceRoute: ruta.distanceRoute,
      locationRoute: 'a',
      priceRoute: ruta.priceRoute,
      traceRoute: ruta.traceRoute);

  print(bodyR.toString());
  var json = jsonEncode(bodyR.toJson());

  print(json);
  final response = await http.post(url,
      headers: {"Content-Type": "application/json"},
      body: json,
      encoding: Utf8Codec());
  print(response.body);
  if (response.statusCode == 200) {
    var decodedResponse = jsonDecode(response.body);
    print(decodedResponse["id"]);
    return decodedResponse["id"];
  } else {
    print("mal");
    throw Exception('Failed to login');
  }
}
