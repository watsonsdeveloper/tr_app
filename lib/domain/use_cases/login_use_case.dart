import 'package:tr_app/domain/repositories/user_repository.dart';

class LoginUseCase {
  final UserRepository _userRepository;

  LoginUseCase(this._userRepository);

  Future<bool> execute(String username, String password) async {
    final userToken = await _userRepository.authenticate(username, password);
    if (userToken == null) {
      throw (Exception('Failed to login'));
    }
    return true;
  }
}
