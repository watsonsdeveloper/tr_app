import 'package:tr_app/domain/entities/user.dart';

abstract class UserRepository {
  User? getUser();
  Future<void> saveUser(User user);
  Future<void> deleteUser();
}
