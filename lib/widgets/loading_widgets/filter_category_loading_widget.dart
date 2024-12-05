import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class FilterCategoryLoadingShimmer extends StatelessWidget {
  const FilterCategoryLoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        4,
        (index) => Row(
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                //margin: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.grey,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text('Filter'),
                ),
              ),
            ),
            SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
