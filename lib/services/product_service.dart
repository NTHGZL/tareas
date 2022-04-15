import 'package:tareas/models/product.dart';
import 'package:tareas/repositories/product_repository.dart';

class ProductService {

  final ProductRepository _productRepository;

  ProductService(this._productRepository);

  Future<List<Product>> getProducts() async {
    final products = await _productRepository.find();
    return products.map((product) => Product.fromMap(product)).toList();
  }

  Future<Product> updateProduct(Product product) async {
    product.completed = !product.completed;
    try{
      final updatedTask = await _productRepository.update(product.id, product.completed);
      return Product.fromMap(updatedTask);
    } catch (e) {
      throw Exception(e.toString());
    }

  }

  Future<Product> createProduct(String title) async{
    try{
      final newProduct = await _productRepository.create(title);
      return Product.fromMap(newProduct);
    }catch(e){
      throw Exception(e.toString());
    }
  }

  Future<Product> deleteProduct(String id) async{
    try{
      final deletedProduct = await _productRepository.delete(id);
      return Product.fromMap(deletedProduct);
    }catch(e){
      throw Exception(e.toString());
    }
  }

  
}