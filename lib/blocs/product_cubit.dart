import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tareas/blocs/item_cubit.dart';
import 'package:tareas/models/item.dart';
import 'package:tareas/models/product.dart';
import 'package:tareas/services/product_service.dart';

class ProductCubit extends Cubit<List<Product>> implements ItemCubit {
 

  final ProductService _productService;
  ProductCubit(List<Product> initialState, this._productService) : super([]);

  Future<void>  addProduct(String title) async{
    try{
      await _productService.createProduct(title);
      loadProducts();
    }catch(e){
      throw Exception(e.toString());
    }
  }


  Future<void> loadProducts() async {
    try {
      final tasks = await _productService.getProducts();
      emit(tasks);
    } catch (e) {
      throw Exception('Impossible de charger les tâches');

    }
  }

  Future<void> updateProduct(Product task) async {

    try {
      await _productService.updateProduct(task);
      final tasks = await _productService.getProducts();

      emit(tasks);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> deleteProduct(String id) async{
    try{
      await _productService.deleteProduct(id);
      final tasks = await _productService.getProducts();
      emit(tasks);
    }catch(e){
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> loadItems() async{
    await loadProducts();
  }

  @override
  Future<void> updateItems(Item item) async {
    await updateProduct(item as Product);
  }

  @override
  Future<void> addItems(String title) async {
    await addProduct(title);
  }

  @override
  Future<void> deleteItems(String id) async{
    await deleteProduct(id);
  }
  
}