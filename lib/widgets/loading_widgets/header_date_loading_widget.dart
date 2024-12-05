import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HeaderDateLoadingShimmer extends StatelessWidget {
  const HeaderDateLoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.grey,
            ),
            child: const Text(
              'Datetime',
              style: TextStyle(color: Colors.grey, fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
        ),
        SizedBox(height: 10),
        Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.grey,
            ),
            child: const Text(
              'This week in Estopona',
              style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ],
    );
  }
}
