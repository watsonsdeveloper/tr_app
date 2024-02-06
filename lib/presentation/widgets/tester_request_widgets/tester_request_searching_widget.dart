import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tr_app/presentation/view_models/cart_view_model.dart';

enum SearchType { text, scan }

class RequestSearchWidget extends HookConsumerWidget {
  final requestFormKey = GlobalKey<FormState>();

  RequestSearchWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final requestController = useTextEditingController();
    final searchFocusNode = useFocusNode();

    final searchType = useState(SearchType.scan);

    final cartState = ref.watch(cartNotifierProvider);

    useEffect(() {
      void listener() {
        // if (requestController.text.isEmpty) {
        //   searchIcon.value = Icons.barcode_reader;
        // } else {
        //   searchIcon.value = Icons.search_outlined;
        // }
        // searchFocusNode.requestFocus();
        // if (pluController.text.isEmpty) {
        //   formKey.currentState!.validate();
        // }
        // debugPrint('pluController : ${pluController.text}');
      }

      requestController.addListener(listener);
      return () {
        // dispose listerner and controller when widget dispose
        requestController.removeListener(listener);
        requestController.dispose();
      };
    }, [requestController]);

    Future<void> addToCart() async {
      // TODO : clear error message
      await ref.read(cartNotifierProvider.notifier).resetState();
      if (requestFormKey.currentState!.validate()) {
        var added = await ref.read(cartNotifierProvider.notifier).addToCart(
              requestController.text.trim(),
            );

        if (added) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                    "${requestController.text.trim()} Added successfully!"),
                backgroundColor: Colors.green,
              ),
            );
          });
          requestController.clear();
        }
        // final ProductState productState = await ref
        //     .read(productSNProvider.notifier)
        //     .getProduct(requestController.text.trim());
        // if (productState.product != null) {
        //   WidgetsBinding.instance.addPostFrameCallback((_) {
        //     Navigator.pushNamed(context, Routes.productDetail);
        //   });
        // } else {
        //   WidgetsBinding.instance.addPostFrameCallback((_) {
        //     ScaffoldMessenger.of(context).showSnackBar(
        //       SnackBar(
        //         content: Text(productState.errorMessage!),
        //         backgroundColor: Colors.red,
        //       ),
        //     );
        //   });
        //   return;
        // }
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 120,
                child: ElevatedButton(
                  onPressed: () {
                    searchType.value = SearchType.text;
                    searchFocusNode.requestFocus();
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Theme.of(context).primaryColor;
                        } else {
                          return searchType.value == SearchType.text
                              ? Theme.of(context).primaryColor
                              : Colors.white;
                        }
                      },
                    ),
                  ),
                  child: Icon(
                    Icons.search_outlined,
                    color: searchType.value == SearchType.text
                        ? Colors.white
                        : Theme.of(context).primaryColor,
                  ),
                ),
              ),
              SizedBox(
                width: 120,
                child: ElevatedButton(
                  onPressed: () {
                    searchType.value = SearchType.scan;
                    searchFocusNode.requestFocus();
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Theme.of(context).primaryColor;
                        } else {
                          return searchType.value == SearchType.scan
                              ? Theme.of(context).primaryColor
                              : Colors.white;
                        }
                      },
                    ),
                  ),
                  child: Icon(
                    Icons.barcode_reader,
                    color: searchType.value == SearchType.scan
                        ? Colors.white
                        : Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Form(
            key: requestFormKey,
            child: TextFormField(
              focusNode: searchFocusNode,
              autofocus: true,
              controller: requestController,
              decoration: InputDecoration(
                hintText: searchType.value == SearchType.text
                    ? 'Enter PLU or Barcode'
                    : 'Scan Barcode',
                suffixIcon: IconButton(
                  icon: Icon(searchType.value == SearchType.text
                      ? Icons.add_shopping_cart
                      : Icons.delete_forever),
                  onPressed: searchType.value == SearchType.text
                      ? addToCart
                      : requestController.clear,
                ),
              ),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              keyboardType: TextInputType.number,
              validator: (value) => value!.isEmpty ? 'plu is required' : null,
              onChanged: (value) {
                if (!cartState.isLoading) {
                  searchType.value == SearchType.scan ? addToCart() : null;
                }
              },
              // onFieldSubmitted: (_) {
              //   searchType.value == SearchType.scan ? search() : null;
              // },
            ),
          ),
          cartState.errorMessage != null
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    cartState.errorMessage!,
                    style: const TextStyle(color: Colors.red),
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
