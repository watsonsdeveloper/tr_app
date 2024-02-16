import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ViewLoading extends StatelessWidget {
  final double height;
  final double width;

  const ViewLoading(
      {super.key, this.height = 120, this.width = double.infinity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          height: height,
          width: width,
          color: Colors.white,
        ),
      ),
    );
  }
}
