import 'package:flutter/material.dart';
import 'package:tr_app/presentation/widgets/shared/skeleton_loading_widgets/view_loading.dart';

class OrderBatchExapndedListSkeletonLoadingWidget extends StatelessWidget {
  const OrderBatchExapndedListSkeletonLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<int> intList = [1, 2, 3, 4];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: intList.map((orderItem) => Loading()).toList(),
      ),
    );
  }
}

Widget Loading() {
  return Card(
    elevation: 2,
    surfaceTintColor: Colors.white.withOpacity(0.3),
    child: Container(
      width: 300,
      child: const Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Center(
              child: Expanded(
                flex: 1,
                child: ViewLoading(width: 120, height: 120),
              ),
            ),
            Row(
              children: [
                Expanded(flex: 2, child: ViewLoading(height: 16)),
                Expanded(flex: 3, child: ViewLoading(height: 16)),
              ],
            ),
            Row(
              children: [
                Expanded(flex: 2, child: ViewLoading(height: 16)),
                Expanded(flex: 3, child: ViewLoading(height: 16)),
              ],
            ),
            Row(
              children: [
                Expanded(flex: 2, child: ViewLoading(height: 16)),
                Expanded(flex: 3, child: ViewLoading(height: 16)),
              ],
            ),
            Row(
              children: [
                Expanded(flex: 2, child: ViewLoading(height: 16)),
                Expanded(flex: 3, child: ViewLoading(height: 16)),
              ],
            ),
            Row(
              children: [
                Expanded(flex: 2, child: ViewLoading(height: 16)),
                Expanded(flex: 3, child: ViewLoading(height: 16)),
              ],
            ),
            Row(
              children: [
                Expanded(flex: 2, child: ViewLoading(height: 16)),
                Expanded(flex: 3, child: ViewLoading(height: 16)),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
