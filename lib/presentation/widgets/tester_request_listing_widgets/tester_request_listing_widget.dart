import 'package:flutter/material.dart';
import 'package:tr_app/presentation/themes/input_theme.dart';
import 'package:tr_app/presentation/widgets/shared/title_widget.dart';
import 'package:tr_app/presentation/widgets/tester_request_listing_widgets/tester_listing_menu_widget.dart';
import 'package:tr_app/presentation/widgets/tester_request_listing_widgets/tester_listing_search_widget.dart';
import 'package:tr_app/presentation/widgets/tester_request_listing_widgets/tester_listing_widget.dart';

class TesterRequestListingWidget extends StatelessWidget {
  const TesterRequestListingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleWidget(title: 'My Request'),
            SizedBoxHeight(),
            TesterListingSearchWidget(),
            SizedBoxHeight(),
            TesterListingMenuWidget(),
            SizedBoxHeight(),
            TesterListingWidget(),
          ],
        ),
      ),
    );
  }
}
