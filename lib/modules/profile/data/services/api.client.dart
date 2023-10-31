import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:viammundi_frontend/modules/profile/data/models/dto/dto_image_profile_model.dart';
import 'package:viammundi_frontend/modules/profile/data/models/token.model.dart';

Future<TokenJWTModel> login(String email, String password) async {
  final url = Uri.http('192.168.1.10:4000', '/auth/login');
  print({'email': email, 'password': password});
  final response =
      await http.post(url, body: {'email': email, 'password': password});
  print(response.body);
  if (response.statusCode == 201) {
    return TokenJWTModel.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to login');
  }
}

Future<TokenJWTModel> register(
    String email, String username, String password) async {
  final url = Uri.http('192.168.1.10:4000', '/auth/register');
  print(url);
  print({'email': email, 'user_name': username, 'password': password});
  final response = await http.post(url,
      body: {'email': email, 'user_name': username, 'password': password});
  print(response.statusCode);
  if (response.statusCode == 201) {
    return TokenJWTModel.fromJson(jsonDecode(response.body));
  } else {
    print("paso por acá");
    throw Exception('Failed to register');
  }
}

Future <imgProfileDTO?> imgProfile(String rutaTotal) async{
  final url = Uri.http(rutaTotal);
  print(url);
  final response = await http.get(url);
  print(response.statusCode);
  if (response.statusCode == 201) {
    final List<int> bytes = response.bodyBytes;
    print(response.body);
    return imgProfileDTO(imageBytes: Uint8List.fromList(bytes));;
  } else {
    print("paso por acá");
    throw Exception('Failed to register');
  }
}

Future <String> authToken(String iduser) async{
  final url = Uri.http('192.168.1.10:4000', '/auth/auth');
  print(url);
  final response = await http.post(url, body: {"tokenJWT":iduser});
  print(response.statusCode);
  if (response.statusCode == 201) {
    Map<String, dynamic> jsonResponse = json.decode(response.body);
    String userId = jsonResponse['respuesta']['id_user'];
    return userId;
  } else {
    print("paso por acá");
    throw Exception('Failed to register');
  }
}

// Future<int> attemptSignUp(String username, String password) async {
//   final url = Uri.http('192.168.1.10:4000', '/auth/register');
//   final response =
//       await http.post(url, body: {'email': email, 'password': password});
//   var res = await http.post('$SERVER_IP/signup',
//       body: {"username": username, "password": password});

//   return res.statusCode;
// }
