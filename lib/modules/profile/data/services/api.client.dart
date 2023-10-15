import 'dart:convert';
import 'package:http/http.dart' as http;
// import 'package:viammundi_frontend/src/models/login.model.dart';
import 'package:viammundi_frontend/modules/profile/data/models/token.model.dart';

Future<TokenJWTModel> login(String email, String password) async {
  final url = Uri.http('192.168.1.10:4000', '/auth/login');
  final response =
      await http.post(url, body: {'email': email, 'password': password});
  if (response.statusCode == 201) {
    print(response.body);
    return TokenJWTModel.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to login');
  }
}
