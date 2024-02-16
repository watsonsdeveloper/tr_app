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
    // await Future.delayed(const Duration(seconds: 0));
    // await ref.read(cartNotifierProvider.notifier).list();
    // return ref.watch(cartNotifierProvider.select(
    //   (value) => value.carts,
    // ));
    // ref.watch(userNotifierProvider).user?.selectedBrand;
    // await ref.read(cartNotifierProvider.notifier).list();

    // final carts = ref.watch(cartNotifierProvider).carts;
    return ref.watch(cartNotifierProvider).carts;
  } catch (e) {
    throw Exception(e.toString());
  }
});

final cartDetailFutureProvider = FutureProvider.autoDispose<Cart?>((ref) async {
  try {
    return ref.watch(cartDetailNotifierProvider).cart;
  } catch (e) {
    throw Exception(e.toString());
  }
});
