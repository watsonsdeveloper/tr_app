import 'package:flutter/material.dart';
import 'package:tr_app/presentation/widgets/shared/skeleton_loading_widgets/view_loading.dart';

class OrderBatchSkeletonLoadingWidget extends StatelessWidget {
  const OrderBatchSkeletonLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: SizedBox(
        height: 500,
        width: double.infinity,
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) => Container(
            color: Colors.white,
            child: const Card(
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  children: [
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
                    Center(child: Icon(Icons.expand_more_outlined)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
