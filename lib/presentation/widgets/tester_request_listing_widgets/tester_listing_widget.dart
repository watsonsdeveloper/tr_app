import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tr_app/domain/entities/tr.dart';
import 'package:tr_app/presentation/providers/tr_list_provider.dart';
import 'package:tr_app/presentation/widgets/tester_request_listing_widgets/tester_listing_item_widget.dart';

class TesterListingWidget extends HookConsumerWidget {
  const TesterListingWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Tr>> trList = ref.watch(trListFutureProvider);

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
      child: trList.when(
        data: (data) => data.isEmpty
            ? const Padding(
                padding: EdgeInsets.all(12),
                child: Center(child: Text('No Result Found')))
            : _buildListView(data),
        loading: () => const Padding(
          padding: EdgeInsets.all(12),
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
        error: (error, stackTrace) => Center(
          child: Text(error.toString().replaceAll('Exception: ', '')),
        ),
      ),
    );
  }

  _buildListView(List<Tr> data) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: data.length,
      itemBuilder: (context, index) {
        // String statusText = StatusState.values.elementAt(index).name;
        // statusText = statusText[0].toUpperCase() + statusText.substring(1);
        // bool isActive = activeStatus == StatusState.values.elementAt(index);
        return TesterListingItemWidget(
          productName: data[index].productName,
          productDescription: data[index].productDescription,
          requestDateTime: DateTime.parse(data[index].requestDateTime),
          status: data[index].status,
          imageUrl: data[index].productImageUrl.toString(),
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
    );
  }
}
