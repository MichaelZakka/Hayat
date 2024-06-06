import 'dart:convert';

import 'package:hayat/data/models/response/login_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppStorage {
  static String? token;
  static saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  static removeToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove('token');
}


  static getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');

    return token;
  }

  static saveUserData(LoginResponse userData) async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = jsonEncode(userData.toJson());
    await prefs.setString('userData', userJson);
  }

  static Future<LoginResponse?> getUserInfoFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString('userData');
    if (userJson != null) {
      final userMap = jsonDecode(userJson);
      var userData = LoginResponse.fromJson(userMap);
      print('------------------------------------------------------');
      print(userData.user!.fullName);
      print(userData.user!.email);
      print('------------------------------------------------------');
      return userData;
    }
    return null;
  }

  static vartoken(String token2) {
    token = token2;
  }

  static Future<void> setAuthState(bool isAuthenticated) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isAuthenticated', isAuthenticated);
  }

  static Future<bool> getAuthState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isAuthenticated') ?? false;
  }

  static clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }
}
