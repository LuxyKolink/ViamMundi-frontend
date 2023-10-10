// import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class authServices {
  Future<http.Response> test() async {
    if (kDebugMode) {
      print("sad");
    }
    try {
      final response = await http.delete(
          Uri.parse('http://192.168.56.1:4000/auth/delete'),
          headers: {'Accept': 'application/json'});
      return response;
    } catch (e) {
      print("pasó");
      print(e.toString());
      return http.Response('Error en la solicitud.', 500);
    }
  }
}
