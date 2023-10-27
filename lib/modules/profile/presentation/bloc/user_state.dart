import 'package:flutter/material.dart';
import 'package:viammundi_frontend/modules/profile/data/models/token.model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/services/api.client.dart';

class UserState extends ChangeNotifier {
  TokenJWTModel? token;
  Exception? error;

  Future<void> loginProvider(String email, String password) async {
    try {
      final tokenModel = await login(email, password);
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('accessToken', tokenModel.tokenJWT);
      token = tokenModel;
      error = null;
      notifyListeners();
    } catch (e) {
      token = null;
      error = e as Exception;
      notifyListeners();
    }
  }
}
