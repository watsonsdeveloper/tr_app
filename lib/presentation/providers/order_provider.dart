import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tr_app/data/services/order_service.dart';
import 'package:tr_app/domain/entities/order.dart';
import 'package:tr_app/domain/entities/order_batch.dart';
import 'package:tr_app/domain/services/order_service.dart';
import 'package:tr_app/domain/use_cases/order_use_case.dart';
import 'package:tr_app/presentation/view_models/order_batch_view_model.dart';
import 'package:tr_app/presentation/view_models/order_view_model.dart';
import 'package:tr_app/utils/constants/enum_constants.dart';

final orderServiceProvider = Provider<OrderService>((ref) {
  return OrderServiceImpl();
});

final orderUseCaseProvider = Provider<OrderUseCase>((ref) {
  return OrderUseCase(ref.watch(orderServiceProvider));
});

final orderBatchFutureProvider = FutureProvider.autoDispose<List<OrderBatch>>(
  (ref) async {
    final orderBatchState = ref.watch(orderBatchNotifierProvider);
    return orderBatchState.orderBatchList ?? [];
  },
);

final orderFutureProvider =
    FutureProvider.autoDispose<List<Order>>((ref) async {
  try {
    final orderState = ref.watch(orderNotifierProvider);
    if (orderState.orderBatchId != null) {
      await ref
          .read(orderNotifierProvider.notifier)
          .list(orderState.orderBatchId!, TrOrderStatus.all, null);
    }
    return orderState.orderList ?? [];
  } catch (e) {
    throw Exception(e.toString());
  }
});
