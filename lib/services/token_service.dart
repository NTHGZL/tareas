import 'package:tareas/repositories/token_repository.dart';

class TokenService {

  final TokenRepository _tokenRepository;

  TokenService({required TokenRepository tokenRepository}) : _tokenRepository = tokenRepository;

  Future<String?> getToken() async {
    return await _tokenRepository.getToken();
  }

  Future<bool> setToken(String token) async {
    return await _tokenRepository.setToken(token);
  }

  Future<bool> deleteToken() async {
    return await _tokenRepository.deleteToken();
  }

}