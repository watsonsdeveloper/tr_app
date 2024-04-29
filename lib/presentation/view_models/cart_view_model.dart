import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tr_app/domain/entities/cart.dart';
import 'package:tr_app/domain/entities/user.dart';
import 'package:tr_app/domain/use_cases/cart_use_case.dart';
import 'package:tr_app/domain/use_cases/order_use_case.dart';
import 'package:tr_app/presentation/providers/cart_provider.dart';
import 'package:tr_app/presentation/providers/order_provider.dart';
import 'package:tr_app/presentation/view_models/user_view_model.dart';
import 'package:tr_app/utils/error_handler.dart';

// final cartNotifierProvider =
//     StateNotifierProvider<CartNotifier, CartState>(
//   (ref) {
//     final user = ref.read(userNotifierProvider).user;
//     final cartUseCase = ref.read(cartUseCaseProvider);
//     final orderUseCase = ref.read(orderUseCaseProvider);
//     return CartNotifier(user, cartUseCase, orderUseCase);
//   },
// );

// class CartState {
//   final List<Cart> carts;
//   final String? errorMessage;
//   final bool isLoading;

//   CartState({
//     this.carts = const [],
//     this.errorMessage,
//     this.isLoading = false,
//   });

//   CartState copyWith({
//     List<Cart>? carts,
//     String? errorMessage,
//     bool? isLoading,
//   }) {
//     return CartState(
//       carts: carts ?? this.carts,
//       errorMessage: errorMessage ?? this.errorMessage,
//       isLoading: isLoading ?? this.isLoading,
//     );
//   }

//   CartState clearErrorMessage() {
//     return CartState(
//       carts: carts,
//       errorMessage: null,
//       isLoading: isLoading,
//     );
//   }

//   CartState resetState() {
//     return CartState(
//       carts: [],
//       errorMessage: null,
//       isLoading: isLoading,
//     );
//   }
// }

// class CartNotifier extends StateNotifier<AsyncValue<List<Cart>>> {
//   final User? _user;
//   final CartUseCase _cartUseCase;
//   final OrderUseCase _orderUseCase;

//   CartNotifier(this._user, this._cartUseCase, this._orderUseCase)
//       : super(const AsyncValue.loading()) {
//     list();
//   }

//   clearErrorMessage() {
//     // state = state.clearErrorMessage();
//     state = const AsyncValue.loading();
//   }

//   resetState() {
//     // state = state.resetState();
//     state = const AsyncValue.data([]);
//   }

//   Future<List<Cart>?> list() async {
//     try {
//       debugPrint('CartNotifier @ list');
//       if (_user == null || _user.storeId == null || _user.username == null) {
//         // state = state.copyWith(
//         //     errorMessage: 'User or storeId is null', isLoading: false);
//         state = AsyncValue.error('User or storeId is null', StackTrace.current);
//         return null;
//       }
//       // state = state.copyWith(isLoading: true);
//       final cartList =
//           await _cartUseCase.getCarts(_user.storeId, _user.selectedBrand);
//       // state = state.copyWith(carts: cartList, isLoading: false);
//       state = AsyncValue.data(cartList);
//       return cartList;
//     } catch (e) {
//       state = AsyncValue.error(
//           ErrorHandler.handleErrorMessage(e), StackTrace.current);
//       return null;
//     }
//   }

//   Future<bool> addToCart(String pluOrBarcode) async {
//     // try {
//     //   if (_user == null || _user.storeId == null || _user.username == null) {
//     //     state = state.copyWith(
//     //         errorMessage: 'User or storeId is null', isLoading: false);
//     //     return false;
//     //   }
//     //   // state = state.copyWith(isLoading: true);
//     //   final addedCart = await _cartUseCase.addToCart(
//     //       pluOrBarcode, _user.storeId!, _user.selectedBrand, _user.username!);
//     //   state = state.copyWith(
//     //       carts: [addedCart, ...state.carts],
//     //       isLoading: false,
//     //       errorMessage: null);
//     //   return true;
//     // } catch (e) {
//     //   state = state.copyWith(
//     //       errorMessage: ErrorHandler.handleErrorMessage(e),
//     //       isLoading: false);
//     //   return false;
//     // }
//     return true;
//   }

//   Future<bool> remove(int trCartId) async {
//     // try {
//     //   if (_user == null || _user.storeId == null) {
//     //     state = state.copyWith(
//     //         errorMessage: 'User or storeId is null', isLoading: false);
//     //     return false;
//     //   }
//     //   // state = state.copyWith(isLoading: true);
//     //   final isRemoved = await _cartUseCase.removeCart(_user.storeId!, trCartId);
//     //   if (isRemoved) {
//     //     state = state.copyWith(
//     //         carts: state.carts
//     //             .where((cart) => cart.trCartId != trCartId)
//     //             .toList());
//     //     return true;
//     //   }
//     //   state = state.copyWith(isLoading: false);
//     // } catch (e) {
//     //   state = state.copyWith(
//     //       errorMessage: ErrorHandler.handleErrorMessage(e),
//     //       isLoading: false);
//     // }
//     // return false;
//     return true;
//   }

//   Future<bool> addCartToOrder() async {
//     // try {
//     //   final cartList = await _orderUseCase.addCartToOrder(
//     //       state.carts, _user!.storeId, _user.selectedBrand, _user.username!);
//     //   state = state.copyWith(carts: cartList, isLoading: false);
//     //   return !cartList
//     //       .any((c) => c.errorMessage != null && c.errorMessage!.isNotEmpty);
//     // } catch (e) {
//     //   state = state.copyWith(
//     //       errorMessage: ErrorHandler.handleErrorMessage(e),
//     //       isLoading: false);
//     //   return false;
//     // }
//     return true;
//   }
// }

final cartNotifierProvider = StateNotifierProvider<CartNotifier, CartState>(
  (ref) {
    final user = ref.read(userNotifierProvider).user;
    final cartUseCase = ref.read(cartUseCaseProvider);
    final orderUseCase = ref.read(orderUseCaseProvider);
    return CartNotifier(user, cartUseCase, orderUseCase);
  },
);

class CartState {
  final List<Cart> carts;
  final String? errorMessage;
  final bool isLoading;
  final bool refresh;

  CartState({
    this.carts = const [],
    this.errorMessage,
    this.isLoading = false,
    this.refresh = false,
  });

  CartState copyWith({
    List<Cart>? carts,
    String? errorMessage,
    bool? isLoading,
    bool? refresh,
  }) {
    return CartState(
      carts: carts ?? this.carts,
      errorMessage: errorMessage ?? this.errorMessage,
      isLoading: isLoading ?? this.isLoading,
      refresh: refresh ?? this.refresh,
    );
  }

  CartState clearErrorMessage() {
    return CartState(
      carts: carts,
      errorMessage: null,
      isLoading: isLoading,
    );
  }

  CartState resetState() {
    return CartState(
      carts: [],
      errorMessage: null,
      isLoading: false,
    );
  }
}

class CartNotifier extends StateNotifier<CartState> {
  final User? _user;
  final CartUseCase _cartUseCase;
  final OrderUseCase _orderUseCase;

  CartNotifier(this._user, this._cartUseCase, this._orderUseCase)
      : super(CartState()) {
    debugPrint('initialize CartNotifier..');
    list(_user!);
  }

  clearErrorMessage() {
    state = state.clearErrorMessage();
  }

  resetState() {
    state = state.resetState();
  }

  copyWith({
    List<Cart>? carts,
    String? errorMessage,
    bool? isLoading,
    bool? refresh,
  }) {
    state = state.copyWith(
      carts: carts,
      errorMessage: errorMessage,
      isLoading: isLoading,
      refresh: refresh,
    );
  }

  updateState(int index, Cart cart) {
    final updatedCarts = List<Cart>.from(state.carts);
    updatedCarts[index] = cart;
    state = state.copyWith(carts: updatedCarts);
  }

  Future<List<Cart>?> list(User user) async {
    try {
      if (user == null || user.storeId == null || user.username == null) {
        state = state.copyWith(
            errorMessage: 'User or storeId is null', isLoading: false);
        return null;
      }

      if (state.isLoading) return null;
      state.copyWith(isLoading: true);

      final cartList =
          await _cartUseCase.getCarts(user.storeId, user.selectedBrand);
      state =
          state.copyWith(carts: cartList, isLoading: false, errorMessage: '');

      return cartList;
    } catch (e) {
      state = state.copyWith(
          carts: [],
          errorMessage: ErrorHandler.handleErrorMessage(e),
          isLoading: false);
    }
  }

  Future<Cart?> addToCart(User user, String pluOrBarcode) async {
    try {
      if (user == null || user.storeId == null || user.username == null) {
        state = state.copyWith(
            errorMessage: 'User or storeId is null', isLoading: false);
        return null;
      }
      if (state.isLoading) return null;
      state = state.copyWith(isLoading: true, errorMessage: '');

      final addedCart = await _cartUseCase.addToCart(
          pluOrBarcode, user.storeId!, user.selectedBrand, user.username!);
      state = state.copyWith(
          carts: [addedCart, ...state.carts],
          isLoading: false,
          errorMessage: '');
      return addedCart;
    } catch (e) {
      state = state.copyWith(
          errorMessage: ErrorHandler.handleErrorMessage(e), isLoading: false);
      return null;
    }
  }

  Future<bool> remove(int trCartId) async {
    try {
      if (_user == null || _user.storeId == null) {
        state = state.copyWith(
            errorMessage: 'User or storeId is null', isLoading: false);
        return false;
      }

      if (state.isLoading) return false;
      // state = state.copyWith(isLoading: true, errorMessage: '');

      final isRemoved = await _cartUseCase.removeCart(_user.storeId!, trCartId);
      if (isRemoved) {
        state = state.copyWith(
            carts:
                state.carts.where((cart) => cart.trCartId != trCartId).toList(),
            isLoading: false,
            errorMessage: '');
        return true;
      }
      state = state.copyWith(
          carts: [...state.carts], isLoading: false, errorMessage: '');
    } catch (e) {
      state = state.copyWith(
          errorMessage: ErrorHandler.handleErrorMessage(e), isLoading: false);
    }
    return false;
  }

  Future<bool?> addCartToOrder(User user) async {
    try {
      if (state.isLoading) return null;
      state = state.copyWith(isLoading: true, errorMessage: '');

      final cartList = await _orderUseCase.addCartToOrder(
          state.carts, user!.storeId, user.selectedBrand, user.username!);
      state =
          state.copyWith(carts: cartList, isLoading: false, errorMessage: '');

      return !cartList
          .any((c) => c.errorMessage != null && c.errorMessage!.isNotEmpty);
    } catch (e) {
      state = state.copyWith(
          errorMessage: ErrorHandler.handleErrorMessage(e), isLoading: false);
      return null;
    }
  }
}
