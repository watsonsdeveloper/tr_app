import 'package:tr_app/domain/entities/global_state.dart';
import 'package:tr_app/domain/repositories/repository.dart';

abstract class GlobalRepository implements Repository<GlobalState> {
  Future<GlobalState?> selectGlobal();
  Future<bool> updateIP(String ip);
}
