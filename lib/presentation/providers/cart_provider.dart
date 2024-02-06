import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tr_app/data/services/cart_service.dart';
import 'package:tr_app/domain/entities/cart.dart';
import 'package:tr_app/domain/services/cart_service.dart';
import 'package:tr_app/domain/use_cases/cart_use_case.dart';
import 'package:tr_app/presentation/view_models/cart_detail_view_model.dart';
import 'package:tr_app/presentation/view_models/cart_view_model.dart';

final cartServiceProvider = Provider<CartService>((ref) {
  return CartServiceImpl();
});

final cartUseCaseProvider = Provider<CartUseCase>((ref) {
  final cartRepository = ref.watch(cartServiceProvider);
  return CartUseCase(cartRepository);
});

final cartFutureProvider = FutureProvider.autoDispose<List<Cart>>((ref) async {
  try {
    final cartState = ref.watch(cartNotifierProvider);
    return cartState.carts;
  } catch (e) {
    throw Exception(e.toString());
  }
});

final cartDetailFutureProvider = FutureProvider.autoDispose<Cart?>((ref) async {
  try {
    final cartDetailState = ref.watch(cartDetailNotifierProvider);
    return cartDetailState.cart;
  } catch (e) {
    throw Exception(e.toString());
  }
});
