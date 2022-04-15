import 'package:tareas/models/task.dart';
import 'package:tareas/repositories/task_repository.dart';

class TaskService {

  final TaskRepository _taskRepository;
  
  TaskService(this._taskRepository);
  
  Future<List<Task>> getTasks() async {
    final tasks = await _taskRepository.find();
    return tasks.map((task) => Task.fromMap(task)).toList();
  }

  Future<Task> updateTask(Task task) async {
    task.completed = !task.completed;
    try{
      final updatedTask = await _taskRepository.update(task.id, task.completed);
      return Task.fromMap(updatedTask);
    } catch (e) {
      throw Exception(e.toString());
    }

  }

  Future<Task> createTask(String title) async{
    try{
      final newTask = await _taskRepository.create(title);
      return Task.fromMap(newTask);
    }catch(e){
      throw Exception(e.toString());
    }
  }
  Future<Task> deleteTask(String id) async{
    try{
      final deletedTask = await _taskRepository.delete(id);
      return Task.fromMap(deletedTask);
    }catch(e){
      throw Exception(e.toString());
    }
  }

  
}