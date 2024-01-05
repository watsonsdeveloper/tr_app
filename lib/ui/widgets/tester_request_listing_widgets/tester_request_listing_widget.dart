import 'package:flutter/material.dart';
import 'package:tr_app/ui/themes/input_theme.dart';
import 'package:tr_app/ui/widgets/shared/title_widget.dart';
import 'package:tr_app/ui/widgets/tester_request_listing_widgets/tester_listing_menu_widget.dart';
import 'package:tr_app/ui/widgets/tester_request_listing_widgets/tester_listing_search_widget.dart';
import 'package:tr_app/ui/widgets/tester_request_listing_widgets/tester_listing_widget.dart';

class TesterRequestListingWidget extends StatelessWidget {
  const TesterRequestListingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TitleWidget(title: 'My Request'),
            const SizedBoxHeight(),
            TesterListingSearchWidget(),
            const SizedBoxHeight(),
            const TesterListingMenuWidget(),
            const SizedBoxHeight(),
            const TesterListingWidget(),
          ],
        ),
      ),
    );
  }
}
