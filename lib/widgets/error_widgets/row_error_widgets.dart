import 'package:flutter/material.dart';

class RowErrorWidgets extends StatelessWidget {
  const RowErrorWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: 5),
        Icon(
          Icons.error_outline,
          color: Colors.redAccent,
          size: 25,
        ),
        SizedBox(width: 10),
        Text(
          "We couldn't load the data.",
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
