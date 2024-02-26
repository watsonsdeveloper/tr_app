import 'package:tr_app/domain/entities/cart.dart';
import 'package:tr_app/domain/entities/uploaded_image.dart';
import 'package:tr_app/domain/services/cart_service.dart';
import 'package:tr_app/utils/constants/enum_constants.dart';

class CartUseCase {
  final CartService _cartService;

  CartUseCase(this._cartService);

  Future<Cart> addToCart(String pluOrBarcode, String storeId, Brand brand,
      String createdBy) async {
    try {
      return await _cartService.addToCart(
          pluOrBarcode, storeId, brand, createdBy);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<bool> removeCart(String storeId, int trCartId) async {
    try {
      return await _cartService.removeCart(storeId, trCartId);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Cart> getCart(String storeId, int trCartId) async {
    try {
      return await _cartService.getCart(storeId, trCartId);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<Cart>> getCarts(String storeId, Brand brand) async {
    try {
      return await _cartService.getCarts(storeId, brand);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Cart> updateCartRequirement(String storeId, int trCartId,
      String username, Reason reason, String? justification) async {
    try {
      return await _cartService.updateCartRequirement(
          storeId, trCartId, username, reason, justification);
    } catch (e) {
      throw Exception(e.toString());
    }
  }


}
