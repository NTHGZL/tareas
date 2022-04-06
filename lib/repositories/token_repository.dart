import 'package:shared_preferences/shared_preferences.dart';

class TokenRepository {


  static const String _key = 'jwtToken';

// function static getToken will return the token
   Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_key);
  }

// function static setToken will set the token
    Future<bool> setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_key, token);
  }

  deleteToken() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(_key);
  }

}