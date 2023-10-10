import 'package:viammundi_frontend/src/models/login.model.dart';

class LoginController {
  Future<LoginModel> login(String email, String password) async {
    try {
      final result = await login(email, password);
      return result;
    } catch (e) {
      throw Exception('Error al iniciar sesión: $e');
    }
  }
}
