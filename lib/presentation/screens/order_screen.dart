import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tr_app/presentation/themes/input_theme.dart';
import 'package:tr_app/presentation/widgets/order_widgets/order_list_widget.dart';

class OrderScreen extends ConsumerWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.orange),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: const Text('Order'),
        ),
        body: const SingleChildScrollView(
          child: Column(
            children: [
              // SearchWidget(search: (String? test) {}),
              // Align(
              //   alignment: Alignment.centerRight,
              //   child: ElevatedButton(
              //     onPressed: () async {
              //       ref
              //           .read(orderNotifierProvider.notifier)
              //           .list(TrOrderStatus.all, null);
              //     },
              //     child: const Text('Refresh'),
              //   ),
              // ),
              SizedBoxHeight(),
              OrderListWidget()
            ],
          ),
        ),
      ),
    );
  }
}
