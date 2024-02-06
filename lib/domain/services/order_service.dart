import 'package:tr_app/domain/entities/cart.dart';
import 'package:tr_app/domain/entities/order.dart';
import 'package:tr_app/domain/entities/order_batch.dart';
import 'package:tr_app/utils/constants/enum_constants.dart';

abstract class OrderService {
  Future<List<OrderBatch>> getOrderBatchList(
      String storeId, Brand brand, TrOrderBatchStatus status);

  Future<List<Order>> getOrderList(String trOrderBatchId, String storeId,
      Brand brand, TrOrderStatus status, String? pluOrBarcode);

  Future<Order> getOrder(String trOrderId, String storeId);

  Future<List<Cart>> addCartToOrder(
      List<Cart> carts, String storeId, Brand brand, String createdBy);
}
