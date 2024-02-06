import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tr_app/domain/entities/global_state.dart';
import 'package:tr_app/domain/repositories/global_repository.dart';

class GlobalNotifier extends StateNotifier<GlobalState> {
  final GlobalRepository _repository;

  GlobalNotifier(this._repository) : super(GlobalState()) {
    init();
  }

  void init() async {
    GlobalState? global = await _repository.selectGlobal();
    if (global != null) {
      state = global;
    }
  }

  void setIP(String storeIP) async {
    try {
      var isUpdated = await _repository.updateIP(storeIP);
      if (isUpdated) {
        state = state.copyWith(storeIP: storeIP);
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
