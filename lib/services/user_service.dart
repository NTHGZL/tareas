import 'dart:convert';

import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tareas/services/user.dart';

class AuthService{

  static const String _baseUrl = 'https://api-tareas.nathangonzalez.fr';
  static const String _loginUrl = '$_baseUrl/auth/local';
  static const String _registerUrl = '$_baseUrl/auth/register';

  static Future<Map<String, dynamic>> login(String email, String password) async {
    final Map<String, dynamic> data = {
      'identifier': email,
      'password': password
    };
    final Response response = await post(Uri.parse(_loginUrl), body: data);
    final Map<String, dynamic> responseData = json.decode(response.body);
    if (responseData['jwt'] != null) {
      return responseData;
    } else {
      throw Exception(responseData['message']);
    }
  }

  static Future<Map<String, dynamic>> register(String email, String password) async {
    final Map<String, dynamic> data = {
      'email': email,
      'password': password
    };
    final Response response = await post(Uri.parse(_registerUrl), body: data);
    final Map<String, dynamic> responseData = json.decode(response.body);
    if (responseData['jwt'] != null) {
      return responseData;
    } else {
      throw Exception(responseData['message']);
    }
  }

  // function to save user data in shared preferences
  static void saveUserData(Map<String, dynamic> userData) async {
    // save user data in shared preferences
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userData', json.encode(userData));
  }

  // function to get user data from shared preferences
  static Future<User?> getUserData() async {
    // get user data from shared preferences
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('userData') != null) {
      final User? userData = json.decode(prefs.getString('userData')?? '');
      return userData;
    } else {
      return null;
    }
  }

}