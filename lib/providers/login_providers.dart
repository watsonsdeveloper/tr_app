import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tr_app/data/repositories/user_repository_impl.dart';
import 'package:tr_app/data/services/user_services.dart';
import 'package:tr_app/domain/repositories/user_repository.dart';
import 'package:tr_app/domain/use_cases/login_use_case.dart';
import 'package:tr_app/providers/shared_providers.dart';
import 'package:tr_app/utils/constants.dart';

final userServiceProvider = Provider<UserService>((ref) {
  return UserService(ref.watch(dioProvider));
});

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepositoryImpl(ref.watch(userServiceProvider));
});

final loginUseCaseProvider = Provider<LoginUseCase>((ref) {
  return LoginUseCase(ref.watch(userRepositoryProvider));
});

final loginProvider = StateProvider<LoginState>((ref) => LoginState.initial);
