import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tr_app/data/repositories/global_repository_impl.dart';
import 'package:tr_app/domain/entities/global_state.dart';
import 'package:tr_app/domain/repositories/global_repository.dart';
import 'package:tr_app/domain/use_cases/global_use_case.dart';

// final globalProvider = StateProvider<Global>((ref) {
//   final globalBox = Hive.box<GlobalModel>(globalHiveBox);
//   if (globalBox.isNotEmpty) {
//     final globalModel = globalBox.getAt(0) as GlobalModel;
//     Global global = globalModel.toGlobal();
//     return global;
//   }
//   return Global();
// });

// final globalSNP =
//     StateNotifierProvider<GlobalViewModel, GlobalModel>((ref) {
//   GlobalViewModel globalVM = GlobalViewModel();
//   final globalBox = Hive.box<GlobalModel>(HiveBox.globalBox);
//   if (globalBox.isNotEmpty) {
//     final globalModel = globalBox.getAt(0) as GlobalModel;
//     if (globalModel.ip != null) {
//       globalVM.setIP(globalModel.ip!);
//     }
//     return globalVM;
//   }
//   return GlobalViewModel();
// });

// class GlobalViewModel extends StateNotifier<GlobalModel> {
//   GlobalViewModel() : super(GlobalModel());

//   void setIP(String ip) async {
//     try {
//       final globalBox = Hive.box<GlobalModel>(HiveBox.globalBox);
//       GlobalModel globalModel = GlobalModel();
//       if (globalBox.isNotEmpty) {
//         globalModel = globalBox.getAt(0) as GlobalModel;
//       }
//       globalModel = globalModel.copyWith(ip: ip);
//       await globalBox.put(0, globalModel);
//       state = state.copyWith(ip: ip);
//     } catch (e) {
//       throw e.toString();
//     }
//   }
// }

final globalRepository = Provider<GlobalRepository>((ref) {
  return GlobalRepositoryImpl();
});

final globalSNP = StateNotifierProvider<GlobalNotifier, GlobalState>((ref) {
  GlobalNotifier globalNotifier = GlobalNotifier(ref.watch(globalRepository));

  return globalNotifier;
});
