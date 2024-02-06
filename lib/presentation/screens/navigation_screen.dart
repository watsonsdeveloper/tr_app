import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tr_app/presentation/view_models/cart_view_model.dart';
import 'package:tr_app/utils/constants/routes_constants.dart';

class NavigationScreen extends HookConsumerWidget {
  final Widget bodyContent;
  final int selectedIndex;
  final Function(int) onItemTapped;
  final String title;

  const NavigationScreen({
    super.key,
    required this.bodyContent,
    required this.selectedIndex,
    required this.onItemTapped,
    required this.title,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('NavigationScreen @ selectedIndex: $selectedIndex');
    // final isKeyboardVisible = useState<bool>(false);

    // useEffect(() {
    //   // SystemChannels.textInput.messageHandler = (message) {
    //   //   final String method = message.method;
    //   //   if (method == "TextInput.show") {
    //   //     if (!isKeyboardVisible.value) {
    //   //       isKeyboardVisible.value = true;
    //   //     }
    //   //   } else if (method == "TextInput.hide") {
    //   //     if (isKeyboardVisible.value) {
    //   //       isKeyboardVisible.value = false;
    //   //     }
    //   //   }
    //   //   return null;
    //   // };

    //   if (MediaQuery.of(context).viewInsets.bottom != 0) {
    //     isKeyboardVisible.value = true;
    //   } else {
    //     isKeyboardVisible.value = false;
    //   }
    //   // keyboardVisibilityListener();
    // }, [MediaQuery.of(context).viewInsets.bottom]);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: bodyContent,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // if (selectedIndex == -1) {
          // final isOrdered =
          //     await ref.read(cartNotifierProvider.notifier).addCartToOrder();
          // if (isOrdered) {
          //   await ref.read(cartNotifierProvider.notifier).resetState();
          //   WidgetsBinding.instance.addPostFrameCallback((_) {
          //     Navigator.pushNamedAndRemoveUntil(
          //       context,
          //       Routes.orderBatch,
          //       (Route<dynamic> route) => true,
          //     );
          //   });
          // }
          // }
          // else {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.testerRequest,
              (Route<dynamic> route) => true,
            );
          });
          // }
        },
        backgroundColor: selectedIndex == -1
            ? Colors.orange
            : Theme.of(context).primaryColor,
        shape: const StadiumBorder(),
        elevation: 2.0,
        child: const Icon(Icons.camera, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const AutomaticNotchedShape(
          RoundedRectangleBorder(),
          StadiumBorder(
            side: BorderSide(),
          ),
        ),
        notchMargin: 8.0,
        color: Theme.of(context).primaryColor,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.list,
                  color: selectedIndex == 0 ? Colors.orange : Colors.white),
              onPressed: () => {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    Routes.orderBatch,
                    (Route<dynamic> route) => true,
                  );
                })
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: Text(
                title,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
            ),
            IconButton(
              icon: Icon(Icons.menu,
                  color: selectedIndex == 1 ? Colors.orange : Colors.white),
              onPressed: () => {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    Routes.home,
                    (Route<dynamic> route) => true,
                  );
                })
              },
            ),
          ],
        ),
      ),
    );
  }
}
