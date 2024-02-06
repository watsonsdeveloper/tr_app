import 'package:tr_app/domain/entities/tr.dart';
import 'package:tr_app/domain/repositories/tr_repository.dart';

class TrRepositoryImpl implements TrRepository {
  TrRepositoryImpl();

  @override
  Future<int> delete(T) {
    throw UnimplementedError();
  }

  @override
  Future<int> insert(T) {
    throw UnimplementedError();
  }

  @override
  Future<List<Tr>> list() {
    throw UnimplementedError();
  }

  @override
  Future<Tr> select(int id) {
    throw UnimplementedError();
  }

  @override
  Future<int> update(T) {
    throw UnimplementedError();
  }
}
