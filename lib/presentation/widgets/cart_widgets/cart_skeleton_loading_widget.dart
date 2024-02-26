import 'package:flutter/material.dart';
import 'package:tr_app/presentation/widgets/shared/skeleton_loading_widgets/view_loading.dart';

class CartSkeletonLoadingWidget extends StatelessWidget {
  const CartSkeletonLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: SizedBox(
        height: 600,
        width: double.infinity,
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) => Container(
            color: Colors.white,
            child: const Column(
              children: [
                Row(
                  children: [
                    Expanded(flex: 2, child: ViewLoading()),
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          ViewLoading(
                            height: 32,
                          ),
                          ViewLoading(
                            height: 32,
                          ),
                          ViewLoading(
                            height: 32,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                ViewLoading(height: 12),
                SizedBox(height: 4),
                ViewLoading(height: 12)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
