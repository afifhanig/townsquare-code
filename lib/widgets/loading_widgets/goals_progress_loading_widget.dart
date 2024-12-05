import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:townsquare_app/util/responsive.dart';

class GoalsProgressLoadingShimmer extends StatelessWidget {
  const GoalsProgressLoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: isMobile ? double.infinity : 320,
        height: MediaQuery.of(context).size.height / 5,
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
