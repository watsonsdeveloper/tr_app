import 'package:flutter/material.dart';
import 'package:tr_app/presentation/screens/cart_screen.dart';
import 'package:tr_app/presentation/screens/navigation_screen.dart';
import 'package:tr_app/presentation/widgets/tester_request_widgets/tester_request_searching_widget.dart';

class TesterRequestScreen extends StatelessWidget {
  const TesterRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('tester_request_screen.dart @ build');

    return NavigationScreen(
      selectedIndex: 1,
      bodyContent: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              RequestSearchWidget(),
              const CartScreen(),
            ],
          ),
        ),
      ),
      onItemTapped: (int) {},
    );
  }
}
