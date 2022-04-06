import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tareas/models/item.dart';

abstract class ListItemCubit{


  Future<void> loadItems();

  Future<void> updateItems(Item item);

  Future<void> addItems(String title);

}