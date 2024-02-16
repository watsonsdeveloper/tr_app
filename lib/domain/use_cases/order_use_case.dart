import 'package:tr_app/domain/entities/cart.dart';
import 'package:tr_app/domain/entities/order.dart';
import 'package:tr_app/domain/entities/order_batch.dart';
import 'package:tr_app/domain/services/order_service.dart';
import 'package:tr_app/utils/constants/enum_constants.dart';

class OrderUseCase {
  final OrderService _orderService;

  OrderUseCase(this._orderService);

  Future<List<OrderBatch>> getOrderBatchList(
      String storeId, Brand brand, TrOrderStatus status, String? pluOrBarcode) async {
    try {
      return _orderService.getOrderBatchList(storeId, brand, status, pluOrBarcode);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<Order>> getOrderList(int trOrderBatchId, String storeId,
      Brand brand, TrOrderStatus status, String? pluOrBarcode) async {
    try {
      return _orderService.getOrderList(
          trOrderBatchId, storeId, brand, status, pluOrBarcode);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Order> getOrder(String trOrderId, String storeId) async {
    try {
      return _orderService.getOrder(trOrderId, storeId);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<Cart>> addCartToOrder(
      List<Cart> carts, String storeId, Brand brand, String createdBy) async {
    try {
      return _orderService.addCartToOrder(carts, storeId, brand, createdBy);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
