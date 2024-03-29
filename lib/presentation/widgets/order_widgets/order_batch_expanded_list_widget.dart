import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tr_app/domain/entities/order.dart';
import 'package:tr_app/presentation/providers/order_provider.dart';
import 'package:tr_app/presentation/view_models/order_batch_view_model.dart';
import 'package:tr_app/presentation/view_models/user_view_model.dart';
import 'package:tr_app/presentation/widgets/order_widgets/order_list_widget.dart';

class OrderBatchExpandedListWidget extends HookConsumerWidget {
  final int orderBatchId;

  const OrderBatchExpandedListWidget({
    super.key,
    required this.orderBatchId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.read(userNotifierProvider).user;
    final orderBatchSearch =
        ref.watch(orderBatchNotifierProvider).orderBatchSearch;

    final orderList = useState<List<Order>>([]);
    final isExpanded = useState<bool>(false);
    final errorMessage = useState<String>('');

    final controller = useAnimationController(
      duration: const Duration(milliseconds: 200),
    );

    Future<void> expand() async {
      try {
        isExpanded.value = !isExpanded.value;
        if (isExpanded.value) {
          controller.forward();
        } else {
          controller.reverse();
        }

        if (!isExpanded.value) {
          return;
        }

        if (orderList.value.isNotEmpty) {
          return;
        }

        if (user == null) {
          return;
        }

        orderList.value = await ref.read(orderUseCaseProvider).getOrderList(
            orderBatchId,
            user.storeId,
            user.selectedBrand,
            orderBatchSearch.trOrderStatus,
            orderBatchSearch.pluOrBarcode);
      } catch (e) {
        throw Exception(e.toString());
      }
    }

    return Column(
      children: [
        ListTile(
          dense: true,
          title: RotationTransition(
            turns: Tween<double>(begin: 0.0, end: 0.5).animate(controller),
            child: const Icon(Icons.expand_more_outlined),
          ),
          onTap: expand,
        ),
        ClipRect(
          child: Align(
            heightFactor: isExpanded.value ? 1.0 : 0.0,
            child: InkWell(
              onTap: null,
              child: errorMessage.value.isNotEmpty
                  ? Text(
                      errorMessage.value,
                      style: const TextStyle(color: Colors.red),
                    )
                  : orderList.value.isEmpty
                      ? const Padding(
                          padding: EdgeInsets.all(12),
                          child: Center(child: Text('No Result Found')),
                        )
                      // : OrderListView(list: orderList.value),

                      : SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: orderList.value
                                .map(
                                  (orderItem) => Card(
                                    elevation: 2,
                                    surfaceTintColor:
                                        Colors.white.withOpacity(0.3),
                                    child: Container(
                                      padding: const EdgeInsets.all(12),
                                      child: OrderItemWidget(orderItem),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
            ),
          ),
        ),
        // ),
      ],
    );
  }
}
