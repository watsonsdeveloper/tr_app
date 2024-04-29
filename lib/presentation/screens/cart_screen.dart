import 'package:flutter/material.dart';
import 'package:tr_app/presentation/widgets/cart_widgets/cart_list_widget.dart';
import 'package:tr_app/presentation/screens/navigation_screen.dart';
import 'package:tr_app/presentation/widgets/cart_widgets/cart_search_widget.dart';
import 'package:tr_app/utils/constants/routes_constants.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('tester_request_screen.dart @ build');

    return NavigationScreen(
      selectedRoute: Routes.cartScreen,
      bodyContent: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CartSearchWidget(),
              const CartListWidget(),
            ],
          ),
        ),
      ),
      onItemTapped: (int) {},
    );
  }
}
