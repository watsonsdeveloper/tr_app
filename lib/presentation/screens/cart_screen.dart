import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tr_app/presentation/providers/cart_provider.dart';
import 'package:tr_app/presentation/view_models/cart_view_model.dart';
import 'package:tr_app/presentation/view_models/order_batch_view_model.dart';
import 'package:tr_app/presentation/widgets/cart_widgets/cart_detail_widget.dart';
import 'package:tr_app/presentation/widgets/cart_widgets/cart_skeleton_loading_widget.dart';
import 'package:tr_app/presentation/widgets/product_image_loader_widget.dart';
import 'package:tr_app/utils/constants/routes_constants.dart';

class CartScreen extends HookConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint("CartScreen @ build");
    final cartNotifier = ref.read(cartNotifierProvider.notifier);

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
            (Route<dynamic> route) => false,
          );
        });
      }
    }

    // useEffect(() {
    //   Future.delayed(const Duration(seconds: 0)).then((_) {
    //     ref.read(cartNotifierProvider.notifier).list();
    //   });
    //   return () {};
    // }, []);

    return RefreshIndicator(
      onRefresh: () async {
        cartNotifier.list();
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

                      final cart = data[index];

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
                          onTap: () => showCartDetail(context),
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
                                  dataRow('Reason : ', cart.reason,
                                      'Select a reason.'),
                                  cart.requireJustify!
                                      ? dataRow('Justification : ',
                                          cart.justification, 'Plesae justify.')
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
            loading: () => CartSkeletonLoadingWidget(),
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
