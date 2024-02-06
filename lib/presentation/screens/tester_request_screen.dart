import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tr_app/presentation/providers/order_provider.dart';
import 'package:tr_app/presentation/screens/cart_screen.dart';
import 'package:tr_app/presentation/screens/navigation_screen.dart';
import 'package:tr_app/presentation/view_models/cart_view_model.dart';
import 'package:tr_app/presentation/view_models/order_batch_view_model.dart';
import 'package:tr_app/presentation/view_models/user_view_model.dart';
import 'package:tr_app/presentation/widgets/tester_request_widgets/tester_request_searching_widget.dart';
import 'package:tr_app/utils/constants/enum_constants.dart';
import 'package:tr_app/utils/constants/routes_constants.dart';

class TesterRequestScreen extends HookConsumerWidget {
  const TesterRequestScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('tester_request_screen.dart @ build');

    Future<void> addCartToOrder() async {
      final isOrdered =
          await ref.read(cartNotifierProvider.notifier).addCartToOrder();
      if (isOrdered) {
        await ref.read(cartNotifierProvider.notifier).resetState();
        await ref.read(orderBatchNotifierProvider.notifier).list(null);
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.orderBatch,
            (Route<dynamic> route) => true,
          );
        });
      }
    }

    return NavigationScreen(
      selectedIndex: -1,
      title: ref.watch(userNotifierProvider).user!.selectedBrand == Brand.own
          ? 'Own Brand'
          : 'A Brand',
      bodyContent: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              RequestSearchWidget(),
              // ElevatedButton(
              //   onPressed: ref.read(cartNotifierProvider.notifier).list,
              //   child: const Text('Refresh'),
              // ),
              const CartScreen(),
              ElevatedButton(
                onPressed: addCartToOrder,
                child: const Text('Confirm Order'),
              ),
            ],
          ),
        ),
      ),
      onItemTapped: (int) {},
    );
  }
}
