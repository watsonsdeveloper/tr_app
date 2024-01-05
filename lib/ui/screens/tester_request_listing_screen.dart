import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tr_app/ui/widgets/tester_request_listing_widgets/tester_request_listing_widget.dart';
import 'package:tr_app/ui/widgets/tester_request_listing_widgets/tester_request_searching_widget.dart';

class TesterRequestListingPage extends HookConsumerWidget {
  const TesterRequestListingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                RequestSearchingWidget(),
                const SizedBox(height: 16),
                const TesterRequestListingWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
