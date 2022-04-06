import 'package:tareas/models/item.dart';

class Task extends Item{


  Task(String title, String id, bool completed) : super(id: id, title: title, completed: completed);

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      map['title'] as String,
      map['id'].toString(),
      map['isChecked'] as bool,
    );
  }

  @override
  String toString() {
    return 'Task{id: $id, title: $title, completed: $completed}';
  }

  @override
  Item fromMap(Map<String, dynamic> map) {
    return Task.fromMap(map);
  }

}