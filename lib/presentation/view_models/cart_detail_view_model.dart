import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tr_app/domain/entities/cart.dart';
import 'package:tr_app/domain/entities/user.dart';
import 'package:tr_app/domain/use_cases/cart_use_case.dart';
import 'package:tr_app/presentation/providers/cart_provider.dart';
import 'package:tr_app/presentation/view_models/user_view_model.dart';

final cartDetailNotifierProvider =
    StateNotifierProvider<CartDetailNotifier, CartDetailState>(
  (ref) {
    final user = ref.watch(userNotifierProvider).user;
    final cartUseCase = ref.watch(cartUseCaseProvider);
    return CartDetailNotifier(user, cartUseCase);
  },
);

class CartDetailState {
  final Cart? cart;
  final String? errorMessage;
  final bool isLoading;

  CartDetailState({
    this.cart,
    this.errorMessage,
    this.isLoading = false,
  });

  CartDetailState copyWith({
    Cart? cart,
    String? errorMessage,
    bool? isLoading,
  }) {
    return CartDetailState(
      cart: cart ?? this.cart,
      errorMessage: errorMessage ?? this.errorMessage,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  factory CartDetailState.fromJson(Map<String, dynamic> json) {
    return CartDetailState(
      cart: Cart.fromJson(json['cart']),
      errorMessage: json['errorMessage'],
      isLoading: json['isLoading'],
    );
  }

  CartDetailState resetState() {
    return CartDetailState(
      cart: cart,
      errorMessage: null,
      isLoading: isLoading,
    );
  }
}

class CartDetailNotifier extends StateNotifier<CartDetailState> {
  final User? _user;
  final CartUseCase _cartUseCase;

  CartDetailNotifier(this._user, this._cartUseCase) : super(CartDetailState());

  Future<Cart?> getCartDetail(int cartId) async {
    try {
      state = state.copyWith(isLoading: true);
      final cart = await _cartUseCase.getCart(_user!.storeId!, cartId);
      state = state.copyWith(cart: cart);
      return cart;
    } catch (e) {
      state = state.copyWith(
          errorMessage: e.toString().replaceAll('Exception: ', ''));
      return null;
    }
  }
}
