import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tareas/blocs/item_cubit.dart';
import 'package:tareas/models/item.dart';
import 'package:tareas/models/task.dart';
import 'package:tareas/services/task_service.dart';

class TaskCubit extends Cubit<List<Task>> implements ItemCubit{

  final TaskService _taskService;
  TaskCubit(List<Task> initialState, this._taskService) : super([]);

  Future<void>  addTask(String title) async{
    try{
      await _taskService.createTask(title);
      loadTasks();
    }catch(e){
      throw Exception(e.toString());
    }
  }


  Future<void> loadTasks() async {
    try {
      final tasks = await _taskService.getTasks();
      emit(tasks);
    } catch (e) {
      throw Exception('Impossible de charger les tâches');

    }
  }

  Future<void> updateTask(Task task) async {

    try {
      await _taskService.updateTask(task);
      final tasks = await _taskService.getTasks();

      emit(tasks);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> deleteTask(String id) async{
    try{
      await _taskService.deleteTask(id);
      final tasks = await _taskService.getTasks();
      emit(tasks);
    }catch(e){
      throw Exception(e.toString());
    }
  }


  void reset() {
    emit([]);
  }

  @override
  Future<void> loadItems() async{
   await loadTasks();
  }

  @override
  Future<void> updateItems(Item item) async {
    await updateTask(item as Task);
  }

  @override
  Future<void> addItems(String title) async {
    await addTask(title);
  }

  @override
  Future<void> deleteItems(String id) async {
    await deleteTask(id);
  }



}