import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tr_app/domain/use_cases/user_use_case.dart';
import 'package:tr_app/presentation/providers/user_provider.dart';
import 'package:tr_app/utils/constants/enum_constants.dart';

// final homeNotifierProvider =
//     StateNotifierProvider<HomeNotifier, HomeState>((ref) {
//   final userUseCase = ref.watch(userUseCaseProvider);
//   return HomeNotifier(userUseCase);
// });

// class HomeState {
//   final bool isLoading;
//   final String? errorMessage;
//   final Brand selectedBrand;
//   final bool isLogout;

//   HomeState({
//     this.isLoading = false,
//     this.errorMessage,
//     this.selectedBrand = Brand.own,
//     this.isLogout = false,
//   });

//   HomeState copyWith({
//     bool? isLoading,
//     String? errorMessage,
//     Brand? selectedBrand,
//     bool? isLogout,
//   }) {
//     return HomeState(
//       isLoading: isLoading ?? this.isLoading,
//       errorMessage: errorMessage ?? this.errorMessage,
//       selectedBrand: selectedBrand ?? this.selectedBrand,
//       isLogout: isLogout ?? this.isLogout,
//     );
//   }
// }

// class HomeNotifier extends StateNotifier<HomeState> {
//   final UserUseCase _userUseCase;

//   HomeNotifier(this._userUseCase) : super(HomeState());

//   Future<void> selectBrand(Brand selectedBrand) async {
//     try {
//       state = state.copyWith(selectedBrand: selectedBrand);
//     } catch (e) {
//       state = state.copyWith(
//         errorMessage: e.toString().replaceAll('Exception: ', ''),
//         isLoading: false,
//       );
//     }
//   }

//   Future<bool> logout() async {
//     var isLogout = false;
//     try {
//       state = state.copyWith(isLoading: true);
//       isLogout = await _userUseCase.logout();
//       state = state.copyWith(isLoading: false, isLogout: isLogout);
//     } catch (e) {
//       state = state.copyWith(
//         errorMessage: e.toString().replaceAll('Exception: ', ''),
//         isLoading: false,
//         isLogout: false,
//       );
//     }
//     return isLogout;
//   }
// }
