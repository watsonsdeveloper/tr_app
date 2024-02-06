import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tr_app/data/services/product_service.dart';
import 'package:tr_app/domain/services/product_service.dart';
import 'package:tr_app/domain/use_cases/product_use_case.dart';
import 'package:tr_app/presentation/view_models/product_view_model.dart';

final productServiceProvider = Provider<ProductService>((ref) {
  return ProductServiceImpl();
});

final productSNProvider = StateNotifierProvider<ProductNotifier, ProductState>(
  (ref) {
    final productService = ref.watch(productServiceProvider);
    return ProductNotifier(productService);
  },
);
