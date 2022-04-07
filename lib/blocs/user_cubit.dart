import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tareas/services/token_service.dart';
import 'package:tareas/services/user_service.dart';

import '../models/user.dart';

class UserCubit extends Cubit<User?>{

  final UserService _userService;
  final TokenService _tokenService;

  UserCubit(User? initialState, this._userService, this._tokenService) : super(initialState);

  Future<void> loadUser() async {
    String? token = await _tokenService.getToken();

    if(token != null){
      try{
        User user = await _userService.getUser();
        emit(user);
      }catch(e){
        await removeUser();
        throw Exception(e.toString());
      }
    }else{
      emit(null);
    }
  }

  Future<void> login(String email, String password) async {
    try{
      User user = await _userService.login(email, password);
      emit(user);
    }catch(e){
      await removeUser();
      throw Exception(e.toString());
    }
  }

  Future<void> register(String email, String password, String name, String lastname) async {
    try{
      User user = await _userService.register(email: email, password: password, name: name, lastname: lastname);
      emit(user);
    }catch(e){
      throw Exception(e.toString());
    }
  }

  Future<void> logout() async {
    await _tokenService.deleteToken();
    emit(null);
  }

  Future<void> removeUser() async{
    String? token = await _tokenService.getToken();
    emit(null);
    if(token != null){
      await _tokenService.deleteToken();
    }


  }
}