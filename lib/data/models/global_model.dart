import 'package:hive/hive.dart';
import 'package:tr_app/domain/entities/global_state.dart';
part 'global_model.g.dart';

@HiveType(typeId: 0)
class GlobalModel {
  @HiveField(0)
  final String? storeIP;

  GlobalModel({
    this.storeIP,
  });

  // from Global
  factory GlobalModel.fromGlobalState(GlobalState global) {
    return GlobalModel(
      storeIP: global.storeIP,
    );
  }

  // to Global
  GlobalState toGlobal() {
    return GlobalState(
      storeIP: storeIP,
    );
  }

  // copy with
  GlobalModel copyWith({
    String? storeIP,
  }) {
    return GlobalModel(
      storeIP: storeIP ?? this.storeIP,
    );
  }
}
