import 'package:tareas/models/item.dart';

class Product extends Item {


  Product(String id, String title, bool completed) : super(id: id, title: title, completed: completed);

  @override
  Item fromMap(Map<String, dynamic> map) {
    return Product.fromMap(map);
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      map['id'].toString(),
      map['title'] as String,
      map['completed'] as bool,
    );


  }


}