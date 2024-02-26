import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tr_app/domain/entities/cart.dart';
import 'package:tr_app/presentation/providers/cart_provider.dart';
import 'package:tr_app/presentation/view_models/cart_view_model.dart';
import 'package:tr_app/presentation/view_models/order_batch_view_model.dart';
import 'package:tr_app/presentation/view_models/user_view_model.dart';
import 'package:tr_app/presentation/widgets/cart_widgets/cart_detail_widget.dart';
import 'package:tr_app/presentation/widgets/cart_widgets/cart_skeleton_loading_widget.dart';
import 'package:tr_app/presentation/widgets/product_image_loader_widget.dart';
import 'package:tr_app/utils/constants/enum_constants.dart';
import 'package:tr_app/utils/constants/routes_constants.dart';

class CartScreen extends HookConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint("CartScreen @ build");
    // final cartNotifier = ref.read(cartNotifierProvider.notifier);

    // useEffect(() {
    //   Future.delayed(Duration.zero, () {
    //     ref
    //         .read(cartNotifierProvider.notifier)
    //         .list(ref.read(userNotifierProvider).user!);
    //   });
    // }, const []);

    Future<void> addCartToOrder() async {
      final user = ref.read(userNotifierProvider).user;
      final isOrdered =
          await ref.read(cartNotifierProvider.notifier).addCartToOrder(user!);
      if (isOrdered) {
        await ref.read(cartNotifierProvider.notifier).resetState();
        final user = ref.read(userNotifierProvider).user;
        await ref
            .read(orderBatchNotifierProvider.notifier)
            .list(user!, TrOrderBatchStatus.all);
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.orderBatch,
            (Route<dynamic> route) => false,
          );
        });
      }
    }

    return RefreshIndicator(
      onRefresh: () async {
        final user = ref.read(userNotifierProvider).user;
        ref.read(cartNotifierProvider.notifier).list(user!);
        // ref.read(refreshCartProvider.notifier).state = true;
      },
      child: ref.watch(cartFutureProvider).when(
            data: (data) => Column(
              children: [
                SizedBox(
                  height: 420,
                  child: ListView.builder(
                    // shrinkWrap: true,
                    // physics: const NeverScrollableScrollPhysics(),
                    itemCount: data.isNotEmpty ? data.length : 1,
                    itemBuilder: (context, index) {
                      if (data.isEmpty) {
                        return SizedBox(
                          height: 300,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.shopping_cart,
                                  size: 48, color: Colors.grey[300]),
                              Text(
                                'Empty Cart',
                                style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Comic Sans MS',
                                    color: Theme.of(context).primaryColor),
                              ),
                            ],
                          ),
                        );
                      }

                      final Cart cart = data[index];

                      return Dismissible(
                        key: Key(cart.trCartId.toString()),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          padding: const EdgeInsets.only(right: 20),
                          color: Colors.red,
                          alignment: Alignment.centerRight,
                          child: const Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ),
                        onDismissed: (direction) {
                          ref
                              .read(cartNotifierProvider.notifier)
                              .remove(cart.trCartId!);
                        },
                        child: InkWell(
                          onTap: () {
                            // reset state
                            showCartDetail(context, cart, index);
                          },
                          child: ListTile(
                            title: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: cart.errorMessage != null &&
                                          cart.errorMessage!.isNotEmpty
                                      ? Colors.red
                                      : Colors.grey.shade200,
                                ),
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: cart.errorMessage != null &&
                                            cart.errorMessage!.isNotEmpty
                                        ? Colors.red.withOpacity(0.3)
                                        : Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                          flex: 2,
                                          child: ProductImageLoader(cart.plu!)),
                                      Expanded(
                                        flex: 3,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              cart.brandName!,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              cart.plu!,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontStyle: FontStyle.italic,
                                              ),
                                            ),
                                            Text(
                                              cart.productName!,
                                              style: const TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  dataRow('Reason : ', cart.reason?.name,
                                      'Select a reason.'),
                                  cart.requireJustify!
                                      ? dataRow(
                                          'Justification : ',
                                          (cart.justification != null &&
                                                  cart.justification!.length >
                                                      30)
                                              ? '${cart.justification?.substring(0, 30)}...'
                                              : cart.justification,
                                          'Plesae justify.')
                                      : const SizedBox.shrink(),
                                  !cart.isAvailableStock!
                                      ? const Text(
                                          'Out of stock',
                                          style: TextStyle(
                                            color: Colors.red,
                                          ),
                                        )
                                      : const SizedBox.shrink(),
                                  cart.errorMessage != null &&
                                          cart.errorMessage!.isNotEmpty
                                      ? Text(
                                          cart.errorMessage!,
                                          style: const TextStyle(
                                            color: Colors.red,
                                          ),
                                        )
                                      : const SizedBox.shrink(),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                data.isNotEmpty
                    ? ElevatedButton(
                        onPressed: addCartToOrder,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                        ),
                        child: const Text(
                          'Checkout',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
            loading: () => const CartSkeletonLoadingWidget(),
            error: (error, stackTrace) => Center(
              child: Text(error.toString().replaceAll('Exception: ', '')),
            ),
          ),
    );
  }

  Widget dataRow(String label, String? value, String? errorMessage) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Text(
                label,
                style:
                    const TextStyle(fontStyle: FontStyle.italic, fontSize: 14),
              )),
          Expanded(
              flex: 3,
              child: Text(
                value ?? errorMessage ?? '',
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 14,
                    color: value == null || value.isEmpty
                        ? Colors.red
                        : Colors.black),
              )),
        ],
      ),
    );
  }
}
