import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tr_app/presentation/view_models/cart_view_model.dart';
import 'package:tr_app/presentation/view_models/user_view_model.dart';

enum SearchType { text, scan }

class CartSearchWidget extends HookConsumerWidget {
  final requestFormKey = GlobalKey<FormState>();

  CartSearchWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = useTextEditingController();
    final searchFocusNode = useFocusNode();

    final searchType = useState(SearchType.scan);
    final isSearching = useState<bool>(false);

    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 500),
    );
    animationController.repeat();

    // useEffect(() {
    //   void listener() {
    //     // if (searchController.text.isEmpty) {
    //     //   searchIcon.value = Icons.barcode_reader;
    //     // } else {
    //     //   searchIcon.value = Icons.search_outlined;
    //     // }
    //     // searchFocusNode.requestFocus();
    //     // if (pluController.text.isEmpty) {
    //     //   formKey.currentState!.validate();
    //     // }
    //     // debugPrint('pluController : ${pluController.text}');
    //   }

    //   searchController.addListener(listener);
    //   return () {
    //     // dispose listerner and controller when widget dispose
    //     // searchController.removeListener(listener);
    //     // searchController.dispose();
    //   };
    // }, [searchController]);

    Future<void> addToCart() async {
      if (isSearching.value) return;
      isSearching.value = true;

      if (requestFormKey.currentState!.validate()) {
        final user = ref.read(userNotifierProvider).user;
        var addedCart = await ref.read(cartNotifierProvider.notifier).addToCart(
              user!,
              searchController.text.trim(),
            );

        if (addedCart != null) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content:
                    Text("${searchController.text.trim()} Added successfully!"),
                backgroundColor: Colors.green,
              ),
            );
          });
          searchController.clear();
        }
      }
      isSearching.value = false;
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              children: [
                Form(
                  key: requestFormKey,
                  child: TextFormField(
                    focusNode: searchFocusNode,
                    autofocus: true,
                    controller: searchController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                          topRight: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 8),
                      hintText: searchType.value == SearchType.text
                          ? 'Enter PLU or Barcode'
                          : 'Scan Barcode',
                      suffixIcon: isSearching.value
                          ? const SizedBox(
                              width: 0,
                              height: 0,
                              child: CircularProgressIndicator(),
                            )
                          : IconButton(
                              icon: Icon(searchType.value == SearchType.text
                                  ? Icons.add_shopping_cart
                                  : Icons.delete_forever),
                              onPressed: () async {
                                if (searchType.value == SearchType.text) {
                                  // final cartState = ref.read(cartNotifierProvider);
                                  // debugPrint('addToCart.. ${cartState.isSearching}');
                                  // if (cartState.isSearching) return;
                                  // ref
                                  //     .read(cartNotifierProvider)
                                  //     .copyWith(isSearching: true, errorMessage: "");
                                  await addToCart();
                                  // ref
                                  //     .read(cartNotifierProvider)
                                  //     .copyWith(isSearching: false);
                                } else {
                                  searchController.clear();
                                  ref
                                      .read(cartNotifierProvider.notifier)
                                      .clearErrorMessage();
                                }
                              },
                            ),
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    keyboardType: TextInputType.number,
                    validator: (value) =>
                        value!.isEmpty ? 'plu is required' : null,
                    onChanged: (value) {
                      if (value.length < 5) {
                        return;
                      }
                      searchType.value == SearchType.scan ? addToCart() : null;
                    },
                    // onFieldSubmitted: (_) {
                    //   searchType.value == SearchType.scan ? search() : null;
                    // },
                  ),
                ),
                // Consumer(
                //   builder: (context, watch, child) {
                //     final cartState = watch(cartNotifierProvider);
                //     return Text(
                //       '${cartState.itemCount}',
                //       style: Theme.of(context).textTheme.headline4,
                //     );
                //   },
                // ref.watch(cartNotifierProvider).isLoading
                //     ? CircularProgressIndicator()
                //     : const SizedBox.shrink(),
                ref.watch(cartNotifierProvider).errorMessage != null
                    ? Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(
                          ref
                              .watch(cartNotifierProvider)
                              .errorMessage
                              .toString(),
                          style: const TextStyle(color: Colors.red),
                        ),
                      )
                    : const SizedBox.shrink(),
                // ),
              ],
            ),
          ),
          SizedBox(
            width: 52,
            height: 48,
            child: ElevatedButton(
              onPressed: () {
                if (searchType.value == SearchType.text) {
                  searchType.value = SearchType.scan;
                } else if (searchType.value == SearchType.scan) {
                  searchType.value = SearchType.text;
                }
                searchController.clear();
                searchFocusNode.requestFocus();
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  const EdgeInsets.all(0),
                ),
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Theme.of(context).primaryColor;
                    } else {
                      return Theme.of(context).primaryColor.withOpacity(0.5);
                    }
                  },
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      bottomLeft: Radius.circular(0),
                      topRight: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                ),
              ),
              child: Icon(
                searchType.value == SearchType.scan
                    ? Icons.search_outlined
                    : Icons.barcode_reader,
                color: Colors.white,
              ),
            ),
          ),
          // const SizedBox(height: 16),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     SizedBox(
          //       width: 120,
          //       child: ElevatedButton(
          //         onPressed: () {
          //           searchController.clear();
          //           searchType.value = SearchType.text;
          //           searchFocusNode.requestFocus();
          //         },
          //         style: ButtonStyle(
          //           backgroundColor: MaterialStateProperty.resolveWith<Color>(
          //             (Set<MaterialState> states) {
          //               if (states.contains(MaterialState.pressed)) {
          //                 return Theme.of(context).primaryColor;
          //               } else {
          //                 return searchType.value == SearchType.text
          //                     ? Theme.of(context).primaryColor
          //                     : Colors.white;
          //               }
          //             },
          //           ),
          //         ),
          //         child: Icon(
          //           Icons.search_outlined,
          //           color: searchType.value == SearchType.text
          //               ? Colors.white
          //               : Theme.of(context).primaryColor,
          //         ),
          //       ),
          //     ),
          //     SizedBox(
          //       width: 120,
          //       child: ElevatedButton(
          //         onPressed: () {
          //           searchController.clear();
          //           searchType.value = SearchType.scan;
          //           searchFocusNode.requestFocus();
          //         },
          //         style: ButtonStyle(
          //           backgroundColor: MaterialStateProperty.resolveWith<Color>(
          //             (Set<MaterialState> states) {
          //               if (states.contains(MaterialState.pressed)) {
          //                 return Theme.of(context).primaryColor;
          //               } else {
          //                 return searchType.value == SearchType.scan
          //                     ? Theme.of(context).primaryColor
          //                     : Colors.white;
          //               }
          //             },
          //           ),
          //         ),
          //         child: Icon(
          //           Icons.barcode_reader,
          //           color: searchType.value == SearchType.scan
          //               ? Colors.white
          //               : Theme.of(context).primaryColor,
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
