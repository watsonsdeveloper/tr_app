import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tr_app/domain/entities/order_batch.dart';
import 'package:tr_app/domain/entities/user.dart';
import 'package:tr_app/domain/use_cases/order_use_case.dart';
import 'package:tr_app/presentation/providers/order_provider.dart';
import 'package:tr_app/presentation/view_models/user_view_model.dart';
import 'package:tr_app/utils/constants/enum_constants.dart';

final orderBatchNotifierProvider =
    StateNotifierProvider<OrderBatchNotifier, OrderBatchState>(
  (ref) {
    final user = ref.watch(userNotifierProvider).user;
    final orderUseCase = ref.watch(orderUseCaseProvider);
    return OrderBatchNotifier(user, orderUseCase);
  },
);

class OrderBatchState {
  final List<OrderBatch>? orderBatchList;
  final String? errorMessage;
  final bool isLoading;

  OrderBatchState({
    this.orderBatchList,
    this.errorMessage,
    this.isLoading = false,
  });

  OrderBatchState copyWith({
    List<OrderBatch>? orderBatchList,
    String? errorMessage,
    bool? isLoading,
  }) {
    return OrderBatchState(
      orderBatchList: orderBatchList ?? this.orderBatchList,
      errorMessage: errorMessage ?? this.errorMessage,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class OrderBatchNotifier extends StateNotifier<OrderBatchState> {
  final User? _user;
  final OrderUseCase _orderUseCase;

  OrderBatchNotifier(this._user, this._orderUseCase)
      : super(OrderBatchState()) {
    list(TrOrderBatchStatus.all);
  }

  Future<void> list(TrOrderBatchStatus? status) async {
    try {
      if (_user == null || _user.storeId == null) {
        state = state.copyWith(
            errorMessage: 'User or storeId is null', isLoading: false);
        return;
      }
      state = state.copyWith(isLoading: true);
      final orderBatchList = await _orderUseCase.getOrderBatchList(
          _user.storeId!,
          _user.selectedBrand,
          status ?? TrOrderBatchStatus.all);
      state = state.copyWith(orderBatchList: orderBatchList, isLoading: false);
    } catch (e) {
      state = state.copyWith(
          errorMessage: e.toString().replaceAll('Exception: ', ''),
          isLoading: false);
    }
  }
}