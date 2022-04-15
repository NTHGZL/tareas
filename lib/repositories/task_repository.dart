import 'package:tareas/repositories/api_repository.dart';

class TaskRepository{

  final ApiRepository _apiRepository;

  TaskRepository(this._apiRepository);

  Future<List<dynamic>> find()async {

    try{
      final response = await _apiRepository.getRequest(url: '/tasks') as List<dynamic>;
      return response;
    }catch(e){
      throw Exception(e.toString());
    }
  }

  Future<dynamic> update (String id, bool completed) async {
    try{
      final response = await _apiRepository.putRequest(url: '/tasks/$id', body: {
        'isChecked': completed.toString(),
      }) as dynamic;
      return response;
    }catch(e){
      throw Exception(e.toString());
    }
  }

  Future<dynamic> create(String title) async{

    try{
      final response = await _apiRepository.postRequest(url: '/tasks',
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
        final response = await _apiRepository.deleteRequest(url: '/tasks/$id');
        return response;
      }catch(e){
        throw Exception(e.toString());
    }
  }

}