import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tr_app/presentation/screens/navigation_screen.dart';
import 'package:tr_app/presentation/themes/input_theme.dart';
import 'package:tr_app/presentation/view_models/order_batch_view_model.dart';
import 'package:tr_app/presentation/widgets/order_widgets/order_batch_list_widget.dart';
import 'package:tr_app/presentation/widgets/search_widget.dart';
import 'package:tr_app/utils/constants/enum_constants.dart';

class OrderBatchScreen extends HookConsumerWidget {
  const OrderBatchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return NavigationScreen(
      selectedIndex: 0,
      onItemTapped: (index) {
        debugPrint('index : $index');
      },
      bodyContent: const SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  //   child: SearchWidget(search: (String? test) {}),
                  // ),
                  // Align(
                  //   alignment: Alignment.centerRight,
                  //   child: ElevatedButton(
                  //     onPressed: () async {
                  //       ref
                  //           .read(orderBatchNotifierProvider.notifier)
                  //           .list(TrOrderBatchStatus.all);
                  //     },
                  //     child: const Text('Refresh'),
                  //   ),
                  // ),
                  SizedBoxHeight(),
                  OrderBatchListWidget(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
