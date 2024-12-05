import 'package:flutter/material.dart';
import 'package:townsquare_app/util/responsive.dart';
import 'package:townsquare_app/widgets/error_widgets/column_error_widgets.dart';

class CardErrorWidgets extends StatelessWidget {
  const CardErrorWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    final _isMobile = Responsive.isMobile(context);
    return Column(
      children: [
        SizedBox(height: 10),
        Material(
          elevation: 14,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            width: _isMobile ? double.infinity : 320,
            height: MediaQuery.of(context).size.height / 4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ColumnErrorWidgets(),
            ),
          ),
        ),
      ],
    );
  }
}
