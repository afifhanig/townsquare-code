import 'package:flutter/material.dart';
import 'package:townsquare_app/widgets/coming_soon_widgets.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '',
              style: TextStyle(fontSize: 24),
            ),
            ComingSoonWidget()
          ],
        ),
      ),
    );
  }
}
