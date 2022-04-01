import 'dart:convert';

import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tareas/models/user.dart';
import 'package:tareas/repositories/token_repository.dart';
import 'package:tareas/repositories/user_repository.dart';

class UserService{

  final UserRepository _userRepository;
  final TokenRepository _tokenRepository;

  UserService(this._userRepository, this._tokenRepository);

  Future<User> login(String email, String password) async {
    try{
      final response = await _userRepository.login(email, password);
      final User user = User.fromMap(response);
      final jwt = response['jwt'];
      _tokenRepository.setToken(jwt);
      return user;
    }catch(e){
      throw Exception(e.toString());
    }
  }

  Future<User> register(
      { required String email,  required String password,  required String name,  required String lastname}) async {
    try{
      final response = await _userRepository.register(email: email, password: password, name: name, lastname: lastname);
      final User user = User.fromMap(response);
      final jwt = response['jwt'];
      _tokenRepository.setToken(jwt);
      return user;
    }catch(e){
      throw Exception(e);
    }
  }
}