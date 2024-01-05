import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tr_app/providers/login_providers.dart';
import 'package:tr_app/utils/constants.dart';

final loginViewModelProvider =
    StateNotifierProvider<LoginViewModel, LoginState>((ref) {
  return LoginViewModel(ref);
});

class LoginViewModel extends StateNotifier<LoginState> {
  final Ref ref;

  LoginViewModel(this.ref) : super(LoginState.initial);

  Future<void> resetState() async {
    state = LoginState.initial;
  }

  Future<void> login(username, String password) async {
    state = LoginState.loading;
    try {
      final loginUseCase = ref.read(loginUseCaseProvider);
      var isLoginSuccess = await loginUseCase.execute(username, password);
      if (isLoginSuccess) {
        state = LoginState.success;
      } else {
        state = LoginState.error;
      }
    } catch (e) {
      state = LoginState.error;
    }
  }
}
