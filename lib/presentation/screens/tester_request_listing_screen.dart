import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tr_app/presentation/screens/navigation_screen.dart';
import 'package:tr_app/presentation/widgets/tester_request_listing_widgets/tester_request_listing_widget.dart';

class TesterRequestListingScreen extends HookConsumerWidget {
  const TesterRequestListingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return NavigationScreen(
      selectedIndex: 0,
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
