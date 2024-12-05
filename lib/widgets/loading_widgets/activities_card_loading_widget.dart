import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ActivitiesCardLoadingShimmer extends StatelessWidget {
  const ActivitiesCardLoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        4,
        (index) => Column(
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                //margin: EdgeInsets.symmetric(vertical: 5),
                width: double.infinity,
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
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
