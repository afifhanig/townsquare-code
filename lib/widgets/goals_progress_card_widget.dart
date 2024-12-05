import 'package:flutter/material.dart';
import 'package:townsquare_app/util/responsive.dart';

class GoalProgressCardWidget extends StatelessWidget {
  final int currentPoints;
  final int targetPoints;

  GoalProgressCardWidget({required this.currentPoints, required this.targetPoints});

  @override
  Widget build(BuildContext context) {
    double progress = currentPoints / targetPoints;
    final isMobile = Responsive.isMobile(context);

    return SizedBox(
      width: isMobile ? null : 320,
      child: Card(
        elevation: 14,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: Color(0xFFBAE6FD), // Light blue color
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "You’re close to your goal!",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(child: widgetInformation()),
                  SizedBox(width: 20),
                  Container(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: CircularProgressIndicator(
                            value: progress,
                            strokeWidth: 7,
                            backgroundColor: Colors.white,
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                          ),
                        ),
                        Text(
                          '27',
                          style: TextStyle(
                            fontSize: 16, // Adjust font size as needed
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  widgetInformation() {
    return Container(
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Join more sport activities to collect more points",
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 11,
              color: Colors.black.withOpacity(0.6),
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Flexible(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.zero,
                    backgroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  ),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "Join now",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20),
              Flexible(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.zero,
                    backgroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  ),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "My Points",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
