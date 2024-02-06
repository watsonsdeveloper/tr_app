import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tr_app/domain/use_cases/user_use_case.dart';
import 'package:tr_app/presentation/providers/user_provider.dart';

final loginStateNotifierProvider =
    StateNotifierProvider<LoginNotifier, LoginState>((ref) {
  final userUseCase = ref.watch(userUseCaseProvider);
  return LoginNotifier(userUseCase);
});

class LoginState {
  final bool isLoading;
  final String? errorMessage;
  final bool isLogin;

  LoginState({
    this.isLoading = false,
    this.errorMessage,
    this.isLogin = false,
  });

  LoginState copyWith({bool? isLoading, String? errorMessage, bool? isLogin}) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      isLogin: isLogin ?? this.isLogin,
    );
  }
}

class LoginNotifier extends StateNotifier<LoginState> {
  final UserUseCase _userUseCase;

  LoginNotifier(this._userUseCase) : super(LoginState());

  Future<void> resetState() async {
    state = state.copyWith(isLoading: false, errorMessage: '');
  }

  Future<void> updateStatus(LoginState status, String? errorMessage) async {
    state = state.copyWith(isLoading: false, errorMessage: errorMessage);
  }

  Future<bool> login(String username, String password) async {
    var isLogin = false;
    try {
      state = state.copyWith(isLoading: true);
      isLogin = await _userUseCase.login(username, password);
      state = state.copyWith(isLoading: false, isLogin: true);
    } catch (e) {
      state = state.copyWith(
          isLoading: false,
          errorMessage: e.toString().replaceAll('Exception: ', ''),
          isLogin: false);
    }
    return isLogin;
  }

  // Future<User?> getUser() async {
  //   try {
  //     User? user = await _userRepository.getUser();
  //     if (user != null) {
  //       state = state.copyWith(user: user);
  //     }
  //     return user;
  //   } catch (e) {
  //     throw Exception(e.toString().replaceAll('Exception: ', ''));
  //   }
  // }
}
