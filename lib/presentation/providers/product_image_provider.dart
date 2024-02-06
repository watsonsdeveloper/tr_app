import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tr_app/data/services/product_service.dart';
import 'package:tr_app/domain/services/product_service.dart';
import 'package:tr_app/domain/use_cases/product_use_case.dart';
import 'package:tr_app/presentation/view_models/product_image_view_model.dart';

final productServiceProvider = Provider<ProductService>((ref) {
  return ProductServiceImpl();
});

final productUseCaseProvider = Provider<ProductUseCase>((ref) {
  final productService = ref.watch(productServiceProvider);
  return ProductUseCase(productService);
});

final productImageProvider =
    StateNotifierProvider<ProductImageNotifier, ProductImageState>(
  (ref) {
    final productUseCase = ref.watch(productUseCaseProvider);
    return ProductImageNotifier(productUseCase);
  },
);

final productImageFutureProvider =
    FutureProvider.family.autoDispose<String, String>((ref, plu) async {
  try {
    return ref.read(productImageProvider.notifier).getProductImageUrl(plu);
  } catch (e) {
    throw Exception(e.toString());
  }
});
