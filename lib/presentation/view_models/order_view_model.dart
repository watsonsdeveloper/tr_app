import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tr_app/domain/entities/order.dart';
import 'package:tr_app/domain/entities/user.dart';
import 'package:tr_app/domain/use_cases/order_use_case.dart';
import 'package:tr_app/presentation/providers/order_provider.dart';
import 'package:tr_app/presentation/view_models/user_view_model.dart';
import 'package:tr_app/utils/constants/enum_constants.dart';

final orderNotifierProvider = StateNotifierProvider<OrderNotifier, OrderState>(
  (ref) {
    final user = ref.watch(userNotifierProvider).user;
    final orderUseCase = ref.watch(orderUseCaseProvider);
    return OrderNotifier(user, orderUseCase);
  },
);

class OrderState {
  final String? orderBatchId;
  final List<Order>? orderList;
  final String? errorMessage;
  final bool isLoading;

  OrderState({
    this.orderBatchId,
    this.orderList,
    this.errorMessage,
    this.isLoading = false,
  });

  OrderState copyWith({
    String? orderBatchId,
    List<Order>? orderList,
    String? errorMessage,
    bool? isLoading,
  }) {
    return OrderState(
      orderBatchId: orderBatchId ?? this.orderBatchId,
      orderList: orderList ?? this.orderList,
      errorMessage: errorMessage ?? this.errorMessage,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class OrderNotifier extends StateNotifier<OrderState> {
  final User? _user;
  final OrderUseCase _orderUseCase;

  OrderNotifier(this._user, this._orderUseCase) : super(OrderState());

  Future<bool> updateState(String orderBatchId) async {
    state = state.copyWith(orderBatchId: orderBatchId);
    return true;
  }

  Future<List<Order>> list(
      String orderBatchId, TrOrderStatus? status, String? pluOrBarcode) async {
    try {
      if (_user == null || _user.storeId == null) {
        state = state.copyWith(
            errorMessage: 'User or storeId is null', isLoading: false);
        return [];
      }
      state = state.copyWith(isLoading: true);
      final orderList = await _orderUseCase.getOrderList(
          orderBatchId,
          _user.storeId!,
          _user.selectedBrand,
          status ?? TrOrderStatus.all,
          pluOrBarcode);
      state = state.copyWith(orderList: orderList, isLoading: false);
      return orderList;
    } catch (e) {
      state = state.copyWith(
          errorMessage: e.toString().replaceAll('Exception: ', ''),
          isLoading: false);
      return [];
    }
  }
}
