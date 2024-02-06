abstract class Service<T> {
  Future<List<T>> getAll();
  Future<T> get(int id);
  Future<T> add(T t);
  Future<T> modify(T t);
  Future<bool> remove(int id);
}
