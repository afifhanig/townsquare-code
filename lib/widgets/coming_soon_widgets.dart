import 'package:flutter/material.dart';
import 'package:townsquare_app/const/constant.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.access_time,
          color: selectionColor,
          size: 50,
        ),
        SizedBox(height: 16),
        Text(
          "Coming Soon",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: selectionColor,
          ),
        ),
        SizedBox(height: 8),
        Text(
          "Stay tuned for updates!",
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
