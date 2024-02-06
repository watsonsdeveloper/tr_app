import 'package:hive/hive.dart';
import 'package:tr_app/data/models/global_model.dart';
import 'package:tr_app/domain/entities/global_state.dart';
import 'package:tr_app/domain/repositories/global_repository.dart';
import 'package:tr_app/utils/constants/hive_constants.dart';

class GlobalRepositoryImpl implements GlobalRepository {
  GlobalRepositoryImpl() {
    // final globalBox = Hive.box<GlobalModel>(HiveBox.globalBox);
    // GlobalModel globalModel = GlobalModel();
  }
  @override
  Future<int> delete(T) {
    throw UnimplementedError();
  }

  @override
  Future<int> insert(T) {
    throw UnimplementedError();
  }

  @override
  Future<List<GlobalState>> list() {
    throw UnimplementedError();
  }

  @override
  Future<GlobalState> select(int id) {
    throw UnimplementedError();
  }

  @override
  Future<int> update(T) {
    throw UnimplementedError();
  }
  // Implement the methods from the GlobalRepository interface here

  @override
  Future<GlobalState?> selectGlobal() {
    try {
      final globalBox = Hive.box<GlobalModel>(HiveBox.globalBox);
      if (globalBox.isNotEmpty) {
        final globalModel = globalBox.getAt(0) as GlobalModel;
        GlobalState global = globalModel.toGlobal();
        return Future.value(global);
      }
      return Future.value(null);
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<bool> updateIP(String storeIP) async {
    try {
      final globalBox = Hive.box<GlobalModel>(HiveBox.globalBox);
      GlobalModel globalModel = GlobalModel();
      if (globalBox.isNotEmpty) {
        globalModel = globalBox.getAt(0) as GlobalModel;
      }
      globalModel = globalModel.copyWith(storeIP: storeIP);
      await globalBox.put(0, globalModel);
      return true;
    } catch (e) {
      throw e.toString();
    }
  }
}
