import 'package:tr_app/domain/entities/user.dart';
import 'package:tr_app/domain/repositories/user_repository.dart';
import 'package:tr_app/domain/services/user_service.dart';

class UserUseCase {
  final UserRepository _userRepository;
  final UserService _userService;

  UserUseCase(this._userRepository, this._userService);

  User? getUser() {
    try {
      User? user = _userRepository.getUser();
      return user;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<bool> login(String username, String password) async {
    try {
      User user = await _userService.login(username, password);
      await _userRepository.saveUser(user);
      return true;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<bool> logout() async {
    try {
      User? user = _userRepository.getUser();
      if (user == null) {
        throw Exception('User not found');
      }
      await _userService.logout(user.username!);
      await _userRepository.deleteUser();
      return true;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

// class UserNotifier extends StateNotifier<UserState> {
//   final UserRepository _userRepository;
//   final UserService _userService;

//   UserNotifier(this._userRepository, this._userService) : super(UserState());

//   Future<void> resetState() async {
//     state = state.copyWith(
//         loginState: LoginState.initial, isLoading: false, errorMessage: null);
//   }

//   Future<void> updateStatus(LoginState status, String? errorMessage) async {
//     state = state.copyWith(
//         loginState: status, isLoading: false, errorMessage: errorMessage);
//   }

//   Future<void> login(String username, String password) async {
//     state = state.copyWith(loginState: LoginState.loading);
//     try {
//       User user = await _userService.authenticate(username, password);
//       await _userRepository.saveUser(user);
//       state = state.copyWith(
//           loginState: LoginState.success, isLoading: false, user: user);
//     } catch (e) {
//       state = state.copyWith(
//           loginState: LoginState.error,
//           isLoading: false,
//           errorMessage: e.toString().replaceAll('Exception: ', ''));
//     }
//   }

//   Future<User?> getUser() async {
//     try {
//       User? user = await _userRepository.getUser();
//       if (user != null) {
//         state = state.copyWith(user: user);
//       }
//       return user;
//     } catch (e) {
//       throw Exception(e.toString().replaceAll('Exception: ', ''));
//     }
//   }
// }
