import 'package:dio/dio.dart';
import 'package:tr_app/domain/repositories/user_repository.dart';
import 'package:tr_app/data/services/user_services.dart';

class UserRepositoryImpl implements UserRepository {
  final UserService _userService;

  UserRepositoryImpl(this._userService);

  @override
  Future<String?> authenticate(String username, String password) async {
    return _userService.authenticate(username, password);
  }
}
