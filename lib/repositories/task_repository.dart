import 'package:tareas/repositories/api_repository.dart';

class TaskRepository{

  final ApiRepository _apiRepository;

  TaskRepository(this._apiRepository);

  Future<List<dynamic>> getTasks()async {

    try{
      final response = await _apiRepository.getRequest(url: '/tasks') as List<dynamic>;
      return response;
    }catch(e){
      throw Exception(e.toString());
    }
  }

  Future<dynamic> updateTask (String id, bool completed) async {
    try{
      final response = await _apiRepository.putRequest(url: '/tasks/$id', body: {
        'isChecked': completed.toString(),
      }) as dynamic;
      return response;
    }catch(e){
      throw Exception(e.toString());
    }
  }

  createTask(String title) async{

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

}