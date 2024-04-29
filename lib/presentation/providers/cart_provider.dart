import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tr_app/data/services/cart_service.dart';
import 'package:tr_app/domain/entities/cart.dart';
import 'package:tr_app/domain/services/cart_service.dart';
import 'package:tr_app/domain/use_cases/cart_use_case.dart';
import 'package:tr_app/presentation/view_models/cart_detail_view_model.dart';
import 'package:tr_app/presentation/view_models/cart_view_model.dart';
import 'package:tr_app/presentation/view_models/user_view_model.dart';
import 'package:tr_app/utils/error_handler.dart';

final cartServiceProvider = Provider<CartService>((ref) {
  return CartServiceImpl();
});

final cartUseCaseProvider = Provider<CartUseCase>((ref) {
  final cartRepository = ref.watch(cartServiceProvider);
  return CartUseCase(cartRepository);
});

final refreshCartProvider = StateProvider.autoDispose<void>((ref) => {});

final cartFutureProvider = FutureProvider.autoDispose<List<Cart>>((ref) async {
  try {
    debugPrint('cartlist - cartFutureProvider @ build');
    final user = ref.watch(userNotifierProvider).user;
    final carts = await ref.read(cartNotifierProvider.notifier).list(user!);
    return carts ?? [];
  } catch (e) {
    throw Exception(ErrorHandler.handleErrorMessage(e));
  }
});

final cartDetailFutureProvider = FutureProvider.autoDispose<Cart?>((ref) async {
  try {
    debugPrint('cartDetailFutureProvider');
    final cartState = ref.watch(cartDetailNotifierProvider);
    return await ref
        .read(cartDetailNotifierProvider.notifier)
        .getCartDetail(cartState.cart!.trCartId!);
  } catch (e) {
    throw ErrorHandler.handleErrorMessage(e);
  }
});
