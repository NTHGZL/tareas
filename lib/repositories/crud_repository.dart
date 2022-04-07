abstract class CrudRepository {
  Future<dynamic> create<T>(T entity);
  Future<dynamic> findOne(String id);
  Future<List<dynamic>> find();
  Future<dynamic> update(dynamic entity);
  Future<void> delete(String id);
}