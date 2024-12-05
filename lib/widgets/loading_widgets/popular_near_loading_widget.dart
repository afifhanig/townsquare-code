import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PopularNearLoadingShimmer extends StatelessWidget {
  const PopularNearLoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: 320,
        height: MediaQuery.of(context).size.height / 2.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text('Filter'),
        ),
      ),
    );
  }
}
