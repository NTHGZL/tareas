import 'package:tareas/models/item.dart';

abstract class ItemCubit{


  Future<void> loadItems();

  Future<void> updateItems(Item item);

  Future<void> addItems(String title);

  Future<void> deleteItems(String id);

}