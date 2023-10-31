import 'package:flutter/material.dart';
import 'package:viammundi_frontend/modules/profile/data/models/token.model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/services/api.client.dart';

class UserState extends ChangeNotifier {
  TokenJWTModel? token;
  Exception? error;
  String? idUser;
  
  Future<bool> loginProvider(String email, String password) async {
    try {
      final tokenModel = await login(email, password);
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('accessToken', tokenModel.tokenJWT);
      token = tokenModel;
      error = null;
      notifyListeners();
      return true;
    } catch (e) {
      token = null;
      error = e as Exception;
      notifyListeners();
      return false;
    }
  }

  Future<bool> registerProvider(
      String email, String username, String password) async {
    try {
      final tokenModel = await register(email, username, password);
      print(tokenModel);
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('accessToken', tokenModel.tokenJWT);
      token = tokenModel;
      error = null;
      notifyListeners();
      return true;
    } catch (e) {
      print("salió");
      token = null;
      error = e as Exception;
      notifyListeners();
      return false;
    }
  }

  authAuth(String token) async {
    try {
      final idUserR = await authToken(token);
      idUser = idUserR;
      error = null;
      notifyListeners();
      return true;
    } catch (e) {
      idUser = null;
      error = e as Exception;
      notifyListeners();
      return false;
    }
  }
}
