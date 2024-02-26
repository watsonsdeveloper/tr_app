import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tr_app/presentation/view_models/cart_view_model.dart';
import 'package:tr_app/presentation/view_models/order_batch_view_model.dart';
import 'package:tr_app/presentation/view_models/user_view_model.dart';
import 'package:tr_app/utils/constants/enum_constants.dart';
import 'package:tr_app/utils/constants/routes_constants.dart';

class NavigationScreen extends HookConsumerWidget {
  final Widget bodyContent;
  final String selectedRoute;
  final Function(int) onItemTapped;

  const NavigationScreen({
    super.key,
    required this.bodyContent,
    required this.selectedRoute,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('NavigationScreen @ selectedRoute: $selectedRoute');
    final user = ref.read(userNotifierProvider).user;
    if (user == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          Routes.login,
          (Route<dynamic> route) => false,
        );
      });
    }
    final selectedBrand = useState<Brand>(user?.selectedBrand ?? Brand.own);
    // final selectedBrand = user?.selectedBrand ?? Brand.own;
    debugPrint('NavigationScreen @ selectedBrand: $selectedBrand');

    logout() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: const Text('Confirm Logout'),
            content: const Text('Are you sure you want to logout?'),
            actions: [
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Logout'),
                onPressed: () {
                  ref.read(cartNotifierProvider.notifier).resetState();
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    Routes.login,
                    (Route<dynamic> route) => false,
                  );
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 32,
        forceMaterialTransparency: true,
        automaticallyImplyLeading: false,
        leading: null,
        title: Text(
          '${selectedBrand.value == Brand.own ? 'Own Brand' : 'A Brand'} - ( M${user?.storeId ?? ''} )',
          softWrap: true,
        ),
        actions: [
          SizedBox(
            height: 24,
            child: ElevatedButton(
              onPressed: () async {
                selectedBrand.value = selectedBrand.value == Brand.own
                    ? Brand.supplier
                    : Brand.own;
                await ref.read(userNotifierProvider.notifier).toggleBrand();
                final user = ref.read(userNotifierProvider).user;
                if (selectedRoute == Routes.testerRequest) {
                  ref.read(cartNotifierProvider.notifier).list(user!);
                } else if (selectedRoute == Routes.orderBatch) {
                  ref
                      .read(orderBatchNotifierProvider.notifier)
                      .list(user!, null);
                }
              },
              child: Consumer(
                builder: (context, ref, child) {
                  return Text(
                    selectedBrand.value == Brand.own ? 'A' : 'W',
                    style: TextStyle(
                      color: selectedBrand.value == Brand.own
                          ? Colors.orange
                          : Theme.of(context).primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Comic Sans MS',
                    ),
                  );
                },
              ),
            ),
          ),
          IconButton(
            iconSize: 24,
            icon: const Icon(
              Icons.logout,
            ),
            onPressed: logout,
          ),
        ],
      ),
      resizeToAvoidBottomInset: true,
      body: bodyContent,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (selectedRoute == Routes.orderBatch) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.testerRequest,
                (Route<dynamic> route) => false,
              );
            });
          } else {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.orderBatch,
                (Route<dynamic> route) => false,
              );
            });
          }
        },
        backgroundColor: Theme.of(context).primaryColor,
        shape: const StadiumBorder(),
        elevation: 2.0,
        child: Icon(
            selectedRoute == Routes.testerRequest
                ? Icons.barcode_reader
                : Icons.list_alt,
            color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      // bottomNavigationBar: BottomAppBar(
      //   shape: const AutomaticNotchedShape(
      //     RoundedRectangleBorder(),
      //     StadiumBorder(
      //       side: BorderSide(),
      //     ),
      //   ),
      //   notchMargin: 8.0,
      //   color: Theme.of(context).primaryColor,
      //   child: Row(
      //     mainAxisSize: MainAxisSize.max,
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     children: <Widget>[
      //       IconButton(
      //         icon: Icon(
      //           Icons.list,
      //           color: selectedIndex == 0 ? Colors.orange : Colors.white,
      //           size: 36,
      //         ),
      //         onPressed: () => {
      //           WidgetsBinding.instance.addPostFrameCallback((_) {
      //             Navigator.pushNamedAndRemoveUntil(
      //               context,
      //               Routes.orderBatch,
      //               (Route<dynamic> route) => false,
      //             );
      //           })
      //         },
      //       ),
      //       // Padding(
      //       //   padding: const EdgeInsets.only(top: 24.0),
      //       //   child: Text(
      //       //     user?.storeName ?? '',
      //       //     style: const TextStyle(
      //       //         color: Colors.white,
      //       //         fontWeight: FontWeight.bold,
      //       //         fontSize: 24),
      //       //   ),
      //       // ),
      //       // IconButton(
      //       //   icon: Icon(
      //       //     Icons.home,
      //       //     color: selectedIndex == 1 ? Colors.orange : Colors.white,
      //       //     size: 36,
      //       //   ),
      //       //   onPressed: () => {
      //       //     WidgetsBinding.instance.addPostFrameCallback((_) {
      //       //       Navigator.pushNamedAndRemoveUntil(
      //       //         context,
      //       //         Routes.home,
      //       //         (Route<dynamic> route) => false,
      //       //       );
      //       //     })
      //       //   },
      //       // ),
      //     ],
      //   ),
      // ),
    );
  }
}
