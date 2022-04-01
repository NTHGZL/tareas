import 'dart:convert';

import 'package:http/http.dart';

class Api {
  static const String _baseUrl = 'https://api-tareas.nathangonzalez.fr';


 static Future<Map<String, dynamic>> getRequest(String url) async {
    final Response response = await get(Uri.parse(_baseUrl + url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load tasks');
    }
  }

  static Future<Map<String, dynamic>> postRequest(String url, Map<String, dynamic> body) async {
    final Response response = await post(Uri.parse(_baseUrl + url), body: body);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load tasks');
    }



  }

  static Future<Map<String, dynamic>> getRequestWithJwtToken(String url, String jwtToken) async {
    final Response response = await get(Uri.parse(_baseUrl + url), headers: {'Authorization': 'Bearer $jwtToken'});
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load tasks');
    }
  }



}