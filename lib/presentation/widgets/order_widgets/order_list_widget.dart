import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tr_app/domain/entities/order.dart';
import 'package:tr_app/presentation/providers/order_provider.dart';
import 'package:tr_app/presentation/themes/constants_theme.dart';
import 'package:tr_app/presentation/widgets/product_image_loader_widget.dart';

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
    return
        // InkWell(
        //   onTap: () {
        //     WidgetsBinding.instance.addPostFrameCallback((_) {
        //       Navigator.pushNamed(context, Routes.order);
        //     });
        //   },
        //   child:
        ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: list.length,
      itemBuilder: (context, index) {
        return OrderItemWidget(list[index]);
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

      // ),
    );
  }
}

class OrderItemWidget extends StatelessWidget {
  final Order order;

  const OrderItemWidget(this.order, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ProductImageLoader(order.plu),
        OrderItemDataRow('Plu', order.plu),
        OrderItemDataRow('Product Name', order.productName),
        OrderItemDataRow('Brand', order.brandName),
        OrderItemDataRow('Supplier Code', order.supplierCode.toString()),
        OrderItemDataRow('Supplier Name', order.supplierName.toString()),
        // OrderItemDataRow('Created At', order.createdAt.toString()),
        order.reason != null
            ? OrderItemDataRow('Reason',
                order.reason != null ? order.reason!.name.toUpperCase() : '')
            : const SizedBox(),
        order.justification != null
            ? OrderItemDataRow(
                'Justification',
                (order.justification != null &&
                        order.justification!.length > 30)
                    ? '${order.justification.toString().substring(0, 30)}...'
                    : order.justification.toString())
            : const SizedBox(),
        OrderItemDataRow('Created By', order.createdBy.toString()),
        OrderItemDataRow(
          'Status',
          order.trOrderStatus.name.toUpperCase(),
          color: trOrderStatusColors[order.trOrderStatus],
        ),
      ],
    );
  }
}

class OrderItemDataRow extends StatelessWidget {
  final String title;
  final String value;
  final Color? color;

  const OrderItemDataRow(this.title, this.value, {super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      // width: 300,
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
              style: TextStyle(color: color ?? Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
