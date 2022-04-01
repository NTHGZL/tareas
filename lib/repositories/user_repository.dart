import 'dart:convert';

import 'api_repository.dart';

class UserRepository{

  final ApiRepository _apiRepository;

  UserRepository(this._apiRepository);

  Future<Map<String, dynamic>> login(String email, String password) async {
    try{
      final response =  await _apiRepository.postRequest(
          url: '/auth/local',
          body: {
            'identifier': email,
            'password': password
          },
          useToken: false
      );
      return response;
    }catch(e){
      throw Exception(e.toString());
    }
  }

  Future<Map<String, dynamic>> register(
      {required String email, required String password, required String name, required String lastname}) async {
    try{
      final response =  await _apiRepository.postRequest(
          url: '/auth/local/register',
          body: {
            'email': email,
            'password': password,
            'name': name,
            'lastname': lastname
          },


          useToken: false
      );
      return response;
    }catch(e){
      throw Exception(e);
    }

  }

}