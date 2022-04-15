import 'package:tareas/repositories/api_repository.dart';

class ProductRepository {

  final ApiRepository _apiRepository;

  ProductRepository(this._apiRepository);

  Future<List<dynamic>> find()async {

    try{
      final response = await _apiRepository.getRequest(url: '/products') as List<dynamic>;
      return response;
    }catch(e){
      throw Exception(e.toString());
    }
  }

  Future<dynamic> update (String id, bool completed) async {
    try{
      final response = await _apiRepository.putRequest(url: '/products/$id', body: {
        'completed': completed.toString(),
      }) as dynamic;
      return response;
    }catch(e){
      throw Exception(e.toString());
    }
  }

  Future<dynamic> create(String title) async{
    try{
      final response = await _apiRepository.postRequest(url: '/products',
          body: {
            'title': title,
          },
          useToken: true) as dynamic;

      return response;
    }catch(e){
      Exception(e.toString());
    }
  }

  Future<dynamic> delete (String id) async {
    try{
      final response = await _apiRepository.deleteRequest(url: '/products/$id');
      return response;
    }catch(e){
      throw Exception(e.toString());
    }
  }

}