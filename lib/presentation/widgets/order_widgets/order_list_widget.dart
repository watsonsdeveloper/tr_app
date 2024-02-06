import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tr_app/domain/entities/order.dart';
import 'package:tr_app/presentation/providers/order_provider.dart';
import 'package:tr_app/utils/constants/routes_constants.dart';

class OrderListWidget extends HookConsumerWidget {
  const OrderListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('OrderListWidget @ build');

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
      child: ref.watch(orderFutureProvider).when(
            data: (data) => data.isEmpty
                ? const Padding(
                    padding: EdgeInsets.all(12),
                    child: Center(child: Text('No Result Found')))
                : OrderListView(list: data),
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

class OrderListView extends StatelessWidget {
  final List<Order> list;

  const OrderListView({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pushNamed(context, Routes.order);
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _dataRow('Plu', list[index].plu),
                  _dataRow('Product Name', list[index].productName),
                  _dataRow('Brand', list[index].brandName),
                  _dataRow(
                      'Supplier Code', list[index].supplierCode.toString()),
                  _dataRow(
                      'Supplier Name', list[index].supplierName.toString()),
                  _dataRow('Created At', list[index].createdAt.toString()),
                  _dataRow('Created By', list[index].createdBy.toString()),
                  _dataRow('Status', list[index].status.name.toUpperCase()),
                ],
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
            flex: 2,
            child: Text(title),
          ),
          Expanded(
            flex: 3,
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
