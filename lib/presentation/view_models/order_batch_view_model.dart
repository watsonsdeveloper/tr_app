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
    final user = ref.read(userNotifierProvider).user;
    final orderUseCase = ref.read(orderUseCaseProvider);
    return OrderBatchNotifier(user, orderUseCase);
  },
);

class OrderBatchSearch {
  final TrOrderStatus trOrderStatus;
  final String? pluOrBarcode;

  OrderBatchSearch({this.trOrderStatus = TrOrderStatus.all, this.pluOrBarcode});
}

class OrderBatchState {
  final OrderBatchSearch orderBatchSearch;
  final List<OrderBatch>? orderBatchList;
  final String? errorMessage;
  final bool isLoading;

  OrderBatchState({
    OrderBatchSearch? orderBatchSearch,
    this.orderBatchList,
    this.errorMessage,
    this.isLoading = false,
  }) : orderBatchSearch = OrderBatchSearch(
            trOrderStatus: TrOrderStatus.all, pluOrBarcode: null);

  OrderBatchState copyWith({
    OrderBatchSearch? orderBatchSearch,
    List<OrderBatch>? orderBatchList,
    String? errorMessage,
    bool? isLoading,
  }) {
    return OrderBatchState(
      orderBatchSearch: orderBatchSearch ?? this.orderBatchSearch,
      orderBatchList: orderBatchList ?? this.orderBatchList,
      errorMessage: errorMessage ?? this.errorMessage,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class OrderBatchNotifier extends StateNotifier<OrderBatchState> {
  final User? _user;
  final OrderUseCase _orderUseCase;

  OrderBatchNotifier(this._user, this._orderUseCase) : super(OrderBatchState());

  Future<List<OrderBatch>?> list(User user, TrOrderBatchStatus? status) async {
    try {
      if (user == null) {
        state = state.copyWith(
            errorMessage: 'User or storeId is null', isLoading: false);
        return null;
      }
      final orderBatchList = await _orderUseCase.getOrderBatchList(
          user.storeId,
          user.selectedBrand,
          state.orderBatchSearch.trOrderStatus,
          state.orderBatchSearch.pluOrBarcode);
      state = state.copyWith(orderBatchList: orderBatchList, isLoading: false);
      return orderBatchList;
    } catch (e) {
      state = state.copyWith(
          errorMessage: e.toString().replaceAll('Exception: ', ''),
          isLoading: false);
      return null;
    }
  }
}
