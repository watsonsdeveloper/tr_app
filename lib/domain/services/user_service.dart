import 'package:tr_app/domain/entities/user.dart';

abstract class UserService {
  Future<User> login(String username, String password);
  Future<bool> logout(String username);
}
