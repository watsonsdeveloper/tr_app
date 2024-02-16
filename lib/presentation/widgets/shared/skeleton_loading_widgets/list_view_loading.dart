import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ListViewLoading extends StatelessWidget {
  const ListViewLoading({super.key});

  @override
  Widget build(BuildContext context) {
    int itemCount = 6;
    return Column(
      children: [
        ListView.builder(
          itemCount: itemCount,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: 320,
                  width: double.infinity,
                  color: Colors.white,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
