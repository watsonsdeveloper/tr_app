import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tr_app/presentation/screens/navigation_screen.dart';
import 'package:tr_app/presentation/widgets/tester_request_listing_widgets/tester_request_listing_widget.dart';
import 'package:tr_app/utils/constants/routes_constants.dart';

class TesterRequestListingScreen extends HookConsumerWidget {
  const TesterRequestListingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return NavigationScreen(
      selectedRoute: Routes.orderBatch,
      onItemTapped: (index) {
        debugPrint('index : $index');
      },
      bodyContent: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: const SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [TesterRequestListingWidget()],
            ),
          ),
        ),
      ),
    );
  }
}
