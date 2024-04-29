import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tr_app/domain/use_cases/product_use_case.dart';

class ProductImageState {
  final Map<String, String> productImageMap;

  ProductImageState({required this.productImageMap});

  ProductImageState copyWith({
    Map<String, String>? productImageMap,
  }) {
    return ProductImageState(
      productImageMap: productImageMap ?? this.productImageMap,
    );
  }
}

class ProductImageNotifier extends StateNotifier<ProductImageState> {
  final ProductUseCase _productUseCase;

  ProductImageNotifier(this._productUseCase)
      : super(ProductImageState(productImageMap: {}));

  Future<String> getProductImageUrl(String plu) async {
    if (state.productImageMap[plu] != null &&
        state.productImageMap[plu]!.isNotEmpty) {
      return state.productImageMap[plu]!;
    }

    final productImageUrl = await _productUseCase.getProductImage(plu);
    if (productImageUrl != null) {
      state = ProductImageState(
          productImageMap: {...state.productImageMap, plu: productImageUrl});
    }

    return productImageUrl ?? '';
  }
}

// var cachedImageList = <String, String>{};
//       for (var tr in trList) {
//         if (cachedImageList.keys.contains(tr.plu)) {
//           updatedTrList
//               .add(tr.copyWith(productImageUrl: cachedImageList[tr.plu]));
//           continue;
//         } else {
//           var productImageUrl = await _productService.getRetekImageUrl(tr.plu);
//           updatedTrList.add(tr.copyWith(productImageUrl: productImageUrl));
//           if (productImageUrl != null) {
//             cachedImageList[tr.plu] = productImageUrl;
//           }
//         }
//       }