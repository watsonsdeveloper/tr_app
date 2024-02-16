import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tr_app/domain/entities/user.dart';
import 'package:tr_app/domain/use_cases/user_use_case.dart';
import 'package:tr_app/presentation/providers/user_provider.dart';
import 'package:tr_app/utils/constants/enum_constants.dart';

// final userNotifierProvider = StateNotifierProvider.autoDispose<UserNotifier, UserState>((ref) {
//   final userUseCase = ref.watch(userUseCaseProvider);
//   return UserNotifier(UserState(), userUseCase);
// });

final userNotifierProvider =
    StateNotifierProvider<UserNotifier, UserState>((ref) {
  final userUseCase = ref.watch(userUseCaseProvider);
  return UserNotifier(userUseCase);
});

class UserState {
  final String? errorMessage;
  final bool isLoading;
  final User? user;

  UserState({this.errorMessage, this.isLoading = false, this.user});

  UserState copyWith({String? errorMessage, bool? isLoading, User? user}) {
    return UserState(
      errorMessage: errorMessage ?? this.errorMessage,
      isLoading: isLoading ?? this.isLoading,
      user: user ?? this.user,
    );
  }

  UserState resetState() {
    return UserState(
      errorMessage: null,
      isLoading: isLoading,
      user: null,
    );
  }
}

class UserNotifier extends StateNotifier<UserState> {
  final UserUseCase _userUseCase;

  UserNotifier(this._userUseCase) : super(UserState()) {
    getUser();
  }

  void getUser() {
    try {
      state = state.copyWith(isLoading: true);
      final user = _userUseCase.getUser();
      if (user != null) {
        state = state.copyWith(isLoading: false, user: user);
      } else {
        state = state.copyWith(isLoading: false);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  void updateUser(User user) {
    try {
      state = state.copyWith(user: user);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<bool> logout() async {
    var isLogout = false;
    try {
      if (state.isLoading) return isLogout;
      state = state.copyWith(isLoading: true);
      isLogout = await _userUseCase.logout();
      state = state.resetState();
    } catch (e) {
      state = state.copyWith(
        errorMessage: e.toString().replaceAll('Exception: ', ''),
        isLoading: false,
      );
    }
    return isLogout;
  }

  Future<void> toggleBrand() async {
    try {
      final user = state.user!.copyWith(
          selectedBrand: state.user?.selectedBrand == Brand.own
              ? Brand.supplier
              : Brand.own);
      state = state.copyWith(user: user);
    } catch (e) {
      state = state.copyWith(
        errorMessage: e.toString().replaceAll('Exception: ', ''),
        isLoading: false,
      );
    }
  }
}
