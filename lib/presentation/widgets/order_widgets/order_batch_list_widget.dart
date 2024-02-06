import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tr_app/domain/entities/order_batch.dart';
import 'package:tr_app/presentation/providers/order_provider.dart';
import 'package:tr_app/presentation/view_models/order_view_model.dart';
import 'package:tr_app/utils/constants/enum_constants.dart';
import 'package:tr_app/utils/constants/routes_constants.dart';

class OrderBatchListWidget extends HookConsumerWidget {
  const OrderBatchListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('OrderBatchListWidget @ build');

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ref.watch(orderBatchFutureProvider).when(
            data: (data) => data.isEmpty
                ? const Padding(
                    padding: EdgeInsets.all(12),
                    child: Center(child: Text('No Result Found')))
                : OrderBatchListView(orderBatchList: data),
            loading: () => const Padding(
              padding: EdgeInsets.all(12),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
            error: (error, stackTrace) => Center(
              child: Text(error.toString().replaceAll('Exception: ', '')),
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: orderBatchList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () async {
              await ref.read(orderNotifierProvider.notifier).list(
                  orderBatchList[index].trOrderBatchId,
                  TrOrderStatus.all,
                  null);
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.pushNamed(context, Routes.order);
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _dataRow(
                      'Order Batch:', orderBatchList[index].trOrderBatchId),
                  _dataRow('Created At:',
                      orderBatchList[index].createdAt.toString()),
                  _dataRow('Status:',
                      orderBatchList[index].status.name.toUpperCase()),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          if (index != 2) {
            return Divider(
              color: Colors.grey.shade200,
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  _dataRow(String title, String value) {
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
            ),
          ),
        ],
      ),
    );
  }
}
