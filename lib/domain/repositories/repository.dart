abstract class Repository<T> {
  Future<List<T>> list();
  Future<T> select(int id);
  // ignore: avoid_types_as_parameter_names
  Future<int> insert(T);
  // ignore: avoid_types_as_parameter_names
  Future<int> update(T);
  // ignore: avoid_types_as_parameter_names
  Future<int> delete(T);
}
