import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tr_app/providers/tester_listing_providers.dart';
import 'package:tr_app/ui/widgets/tester_request_listing_widgets/tester_listing_item_widget.dart';
import 'package:tr_app/utils/constants.dart';

class TesterListingWidget extends HookConsumerWidget {
  const TesterListingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeStatus = ref.watch(activeStatusProvider);
    final dateTimeNow = DateTime.now();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: 3,
        itemBuilder: (context, index) {
          // String statusText = StatusState.values.elementAt(index).name;
          // statusText = statusText[0].toUpperCase() + statusText.substring(1);
          // bool isActive = activeStatus == StatusState.values.elementAt(index);
          return TesterListingItemWidget(
            productName: 'productName',
            productDescription:
                'productDescription productDescription productDescription productDescription productDescription productDescription productDescription',
            requestDateTime: dateTimeNow,
            status: activeStatus,
            imageUrl:
                'https://p16-oec-va.ibyteimg.com/tos-maliva-i-o3syd03w52-us/9bbaac7890de422e91e02540f0b353a3~tplv-o3syd03w52-origin-jpeg.jpeg?from=520841845',
          );
        },
        separatorBuilder: (context, index) {
          if (index != 2) {
            return Divider(
              color: Colors.grey.shade200,
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
