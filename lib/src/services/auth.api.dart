import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class authServices {
  Future<http.Response> test() async {
    final response =
        await http.delete(Uri.parse('http://192.168.56.1:4000/auth/'));
    if (kDebugMode) {
      print(response);
      print("sad");
    }
    return response;
  }
}
