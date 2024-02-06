import 'package:tr_app/domain/entities/cart.dart';
import 'package:tr_app/domain/services/service.dart';
import 'package:tr_app/utils/constants/enum_constants.dart';

abstract class CartService implements Service<Cart> {
  Future<Cart> getCart(String storeId, int trCartId);
  Future<List<Cart>> getCarts(String storeId, Brand brand);
  Future<Cart> addToCart(
      String pluOrBarcode, String storeId, Brand brand, String createdBy);
  Future<bool> removeCart(String storeId, int trCartId);
}
