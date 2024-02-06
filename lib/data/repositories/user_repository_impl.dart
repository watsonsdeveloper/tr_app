import 'package:hive/hive.dart';
import 'package:tr_app/data/models/user_model.dart';
import 'package:tr_app/domain/entities/user.dart';
import 'package:tr_app/domain/repositories/user_repository.dart';
import 'package:tr_app/utils/constants/hive_constants.dart';

class UserRepositoryImpl implements UserRepository {
  final Box<UserModel> box;

  UserRepositoryImpl(this.box) {
    // box = Hive.box<UserModel>(HiveBox.userBox);
    // user = getUser() as User;
  }

  @override
  User? getUser() {
    try {
      final UserModel? userModel = box.get(HiveKey.user);
      if (userModel != null) {
        return userModel.toUser();
      }
      return null;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<void> saveUser(User user) async {
    box.put(HiveKey.user, UserModel.fromUser(user));
  }

  @override
  Future<void> deleteUser() async {
    box.delete(HiveKey.user);
  }
}
