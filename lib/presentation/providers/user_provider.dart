import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:tr_app/data/models/user_model.dart';
import 'package:tr_app/data/repositories/user_repository_impl.dart';
import 'package:tr_app/data/services/user_service.dart';
import 'package:tr_app/domain/repositories/user_repository.dart';
import 'package:tr_app/domain/use_cases/user_use_case.dart';
import 'package:tr_app/presentation/providers/global_provider.dart';
import 'package:tr_app/utils/constants/hive_constants.dart';

final userServiceProvider = Provider<UserServiceImpl>((ref) {
  final globalState = ref.watch(globalSNP);
  return UserServiceImpl(globalState);
});

final userRepositoryProvider = Provider<UserRepository>((ref) {
  final hiveBox = Hive.box<UserModel>(HiveBox.userBox);
  return UserRepositoryImpl(hiveBox);
});

// final userSNProvider = StateNotifierProvider<UserNotifier, UserState>((ref) {
//   return UserNotifier(
//       ref.watch(userRepositoryProvider), ref.watch(userServiceProvider));
// });

// final userProvider = FutureProvider.autoDispose<User?>((ref) async {
//   return ref.watch(userSNProvider).user;
// });

final userUseCaseProvider = Provider<UserUseCase>((ref) {
  return UserUseCase(
      ref.watch(userRepositoryProvider), ref.watch(userServiceProvider));
});
