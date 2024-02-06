import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tr_app/domain/entities/product.dart';
import 'package:tr_app/domain/services/product_service.dart';
import 'package:tr_app/presentation/view_models/product_view_model.dart';

class ProductUseCase {
  final ProductService _productService;

  ProductUseCase(this._productService);

  // Future<ProductState> getProduct(String pluOrBarcode) async {
  //   return ProductNotifier(_productService).getProduct(pluOrBarcode);
  // }

  Future<String?> getProductImage(String pluOrBarcode) async {
    return await _productService.getRetekImageUrl(pluOrBarcode);
  }
}

class ProductNotifier extends StateNotifier<ProductState> {
  final ProductService _productService;

  ProductNotifier(this._productService) : super(ProductState());

  Future<ProductState> getProduct(String pluOrBarcode) async {
    try {
      state = state.copyWith(isLoading: true);
      Product product = await _productService.getFilter(pluOrBarcode);
      try {
        String? imageUrl = await _productService.getRetekImageUrl(pluOrBarcode);
        product = product.copyWith(imageUrl: imageUrl);
      } catch (e) {
        // do nothing avoid network error.
      }
      state = state.copyWith(product: product, isLoading: false);
    } catch (e) {
      state = ProductState(
          errorMessage: e.toString().replaceAll('Exception: ', ''),
          isLoading: false);
    }
    return state;
  }
}
