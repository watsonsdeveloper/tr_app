import 'package:tr_app/domain/entities/product.dart';

class ProductState {
  final Product? product;
  final String? errorMessage;
  final bool isLoading;

  ProductState({
    this.product,
    this.errorMessage,
    this.isLoading = false,
  });

  ProductState copyWith({
    Product? product,
    String? errorMessage,
    bool? isLoading,
  }) {
    return ProductState(
      product: product ?? this.product,
      errorMessage: errorMessage ?? this.errorMessage,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
