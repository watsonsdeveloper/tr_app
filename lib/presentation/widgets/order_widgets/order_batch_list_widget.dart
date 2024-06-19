import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tr_app/domain/entities/order_batch.dart';
import 'package:tr_app/presentation/providers/order_provider.dart';
import 'package:tr_app/presentation/themes/constants_theme.dart';
import 'package:tr_app/presentation/view_models/order_batch_view_model.dart';
import 'package:tr_app/presentation/view_models/user_view_model.dart';
import 'package:tr_app/presentation/widgets/order_widgets/order_batch_expanded_list_widget.dart';
import 'package:tr_app/presentation/widgets/order_widgets/order_batch_skeleton_loading_widget.dart';

class OrderBatchListWidget extends HookConsumerWidget {
  const OrderBatchListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('OrderBatchListWidget @ build');
    final isLoading = useState<bool>(false);
    return Container(
      padding: const EdgeInsets.all(12),
      height: 500,
      child: RefreshIndicator(
        onRefresh: () async {
          isLoading.value = true;
          // TODO : remove error mssage
          ref.read(orderBatchNotifierProvider).copyWith(errorMessage: '');
          await ref.refresh(orderBatchFutureProvider.future);
          if (context.mounted) {
            isLoading.value = false;
          }
        },
        child: ref.watch(orderBatchFutureProvider).when(
              data: (data) => isLoading.value
                  ? const OrderBatchSkeletonLoadingWidget()
                  : Consumer(builder: (context, watch, child) {
                      ref.watch(userNotifierProvider).user;
                      final data =
                          ref.watch(orderBatchNotifierProvider).orderBatchList;
                      return OrderBatchListView(orderBatchList: data ?? []);
                    }),
              loading: () => const OrderBatchSkeletonLoadingWidget(),
              error: (error, stackTrace) => Center(
                child: Text(error.toString()),
              ),
            ),
      ),
    );
  }
}

class OrderBatchListView extends HookConsumerWidget {
  final List<OrderBatch> orderBatchList;

  const OrderBatchListView({super.key, required this.orderBatchList});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      // physics: const NeverScrollableScrollPhysics(),
      // shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: orderBatchList.isNotEmpty ? orderBatchList.length : 1,
      itemBuilder: (context, index) {
        if (orderBatchList.isEmpty) {
          return SizedBox(
            height: 450,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.list, size: 48, color: Colors.grey[300]),
                  Text(
                    'No Orders',
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Comic Sans MS',
                        color: Theme.of(context).primaryColor),
                  ),
                ],
              ),
            ),
          );
        }

        // InkWell(
        //   onTap: () async {
        //     await ref.read(orderNotifierProvider.notifier).list(
        //         orderBatchList[index].trOrderBatchId,
        //         TrOrderStatus.all,
        //         null);
        //     WidgetsBinding.instance.addPostFrameCallback((_) {
        //       Navigator.pushNamed(context, Routes.order);
        //     });
        //   },
        //   child:
        return Card(
          elevation: 2,
          margin: const EdgeInsets.symmetric(
            vertical: 12,
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _dataRow('Order No:',
                    orderBatchList[index].trOrderBatchId.toString(), null),
                _dataRow('Created By:', orderBatchList[index].createdBy, null),
                _dataRow('Created At:',
                    orderBatchList[index].createdAt.toString(), null),
                _dataRow(
                    'Status:',
                    orderBatchList[index].trOrderBatchStatus.name.toUpperCase(),
                    trOrderBatchStatusColors[
                        orderBatchList[index].trOrderBatchStatus]),
                OrderBatchExpandedListWidget(
                    orderBatchId: orderBatchList[index].trOrderBatchId),
              ],
            ),
          ),
        );
        // );
      },
    );
  }

  _dataRow(String title, String value, Color? color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Text(title),
          ),
          Expanded(
            flex: 2,
            child: Text(
              value,
              softWrap: true,
              style: TextStyle(color: color ?? Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
