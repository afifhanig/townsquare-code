import 'package:flutter/material.dart';
import 'package:townsquare_app/util/responsive.dart';
import 'package:townsquare_app/widgets/activity_list.dart';
import 'package:townsquare_app/widgets/general_info_widget.dart';
import 'package:townsquare_app/widgets/header_widget.dart';

class ActivitiesScreen extends StatelessWidget {
  const ActivitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 7,
            child: Align(
              alignment: Alignment.topLeft,
              child: SingleChildScrollView(
                child: Container(
                  color: Colors.transparent,
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 40),
                      HeaderWidget(),
                      ActivityList(),
                      SizedBox(height: 18),
                    ],
                  ),
                ),
              ),
            ),
          ),
          if (Responsive.isDesktop(context))
            const Expanded(
              flex: 3,
              child: GeneralInformationWidget(),
            ),
        ],
      ),
    );
  }
}
