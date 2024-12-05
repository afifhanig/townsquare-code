import 'package:flutter/material.dart';

class ColumnErrorWidgets extends StatelessWidget {
  const ColumnErrorWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(width: 5),
        Icon(
          Icons.error_outline,
          color: Colors.redAccent,
          size: 25,
        ),
        SizedBox(height: 8),
        Text(
          "We couldn't load the data",
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
