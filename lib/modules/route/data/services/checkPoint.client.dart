import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:viammundi_frontend/modules/route/data/models/dto/CheckPoint.DTO.dart';

Future<int?> setCheckPoint(ReqCompleteCheckPointDTO checkPoint) async {
  final url = Uri.http('192.168.1.10:8000', '/checkpoint/createCheckpoint');
  print(url);
final idString = checkPoint.routeId;
final data = {
    'name': checkPoint.name,
    'description': checkPoint.description,
    'coordinates': checkPoint.coordinates,
    'route_id': checkPoint.routeId
  };

  print(data);

  final response = await http
      .post(url, body: jsonEncode(data) );
  print("PASOOOO");
  print(response.statusCode);
  if (response.statusCode == 200) {
    print("correcto");
    var decodedResponse = jsonDecode(response.body);
    print(decodedResponse["id"]);
    return decodedResponse["id"];
  } else {
    print("mal");
    throw Exception('Failed to login');
  }
}


Future<bool> sendFile(File file, String nombre) async {
  var uri = Uri.parse('http://192.168.1.10:8000/checkpoint/uploadImageVideo');
  var request = http.MultipartRequest('POST', uri);

  var stream = new http.ByteStream(file.openRead());
  var length = await file.length();

  var multipartFile = new http.MultipartFile('myFile', stream, length,
      filename: nombre);
  request.files.add(multipartFile);

  var response = await request.send();
  if (response.statusCode == 200) {
    print('El archivo ha sido subido');
    return true;
  } else {
    print('Error al subir el archivo');
    return false;
  }
}


