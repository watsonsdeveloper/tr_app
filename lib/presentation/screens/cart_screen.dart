import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tr_app/presentation/providers/cart_provider.dart';
import 'package:tr_app/presentation/providers/product_image_provider.dart';
import 'package:tr_app/presentation/view_models/cart_view_model.dart';
import 'package:tr_app/presentation/widgets/cart_widgets/cart_detail_widget.dart';

class CartScreen extends HookConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(const Duration(seconds: 1));
        ref.read(cartNotifierProvider.notifier).list();
      },
      child: ref.watch(cartFutureProvider).when(
            data: (data) => data.isEmpty
                ? Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      width: double.infinity,
                      height: 320,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1.0,
                        ),
                      ),
                      child: const Center(
                        child: Text('No Result Found'),
                      ),
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final cart = data[index];

                      return Dismissible(
                        key: Key(cart.trCartId.toString()),
                        direction: DismissDirection.endToStart,
                        background: Container(
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
                            title: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: ref
                                          .watch(productImageFutureProvider(
                                              cart.plu!))
                                          .when(
                                            data: (productImageUrl) =>
                                                Image.network(
                                              productImageUrl,
                                              width: 120,
                                              height: 120,
                                              fit: BoxFit.cover,
                                              errorBuilder:
                                                  (BuildContext context,
                                                      Object exception,
                                                      StackTrace? stackTrace) {
                                                return const Icon(Icons.error,
                                                    color: Colors.red,
                                                    size: 52);
                                              },
                                            ),
                                            loading: () =>
                                                const CircularProgressIndicator(),
                                            error: (error, stackTrace) =>
                                                const Icon(Icons.error,
                                                    color: Colors.red,
                                                    size: 52),
                                          ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        cart.productName.toString(),
                                        softWrap: true,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            trailing: const Icon(Icons.delete_forever,
                                color: Colors.red),
                          ),
                        ),
                      );
                    },
                  ),
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
