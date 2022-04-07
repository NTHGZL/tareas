import 'dart:convert';

import 'package:http/http.dart';
import 'package:tareas/repositories/token_repository.dart';

class ApiRepository {
  static const String _baseUrl = 'https://api-tareas.nathangonzalez.fr';

  final TokenRepository _tokenRepository;

  ApiRepository(this._tokenRepository);

  Future<dynamic> getRequest({required String url}) async {

    final token = await _tokenRepository.getToken();

    final response = await get(
      Uri.parse('$_baseUrl$url'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(response.body);
    }
  }


  Future<dynamic> postRequest({required String url, required Map<String, dynamic> body, required bool useToken}) async {

    Response response;

    if (useToken) {
      final token = await _tokenRepository.getToken();
      response = await post(
        Uri.parse('$_baseUrl$url'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json'

        },
        body: jsonEncode(body),
      );
    } else {
      response = await post(
        Uri.parse('$_baseUrl$url'),
        body: body,
      );
    }



    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(response.body);
    }
  }

  Future<dynamic> putRequest({required String url, required Map<String, dynamic> body}) async {
    final token = await _tokenRepository.getToken();
    Response response = await put(
      Uri.parse('$_baseUrl$url'),
      headers: {
        'Authorization': 'Bearer $token',
      },
      body: body,
    );

    if(response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(response.body);
    }
  }




}