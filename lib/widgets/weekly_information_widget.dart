import 'package:flutter/material.dart';

class WeeklyInformationWidget extends StatelessWidget {
  WeeklyInformationWidget();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      child: Card(
        //margin: EdgeInsets.all(16),
        elevation: 14,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: Color(0xFFFBF2C0), // Light blue color
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 100),
              const Text(
                "Weekly workshop for kids",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              const Text(
                "Sign up for early access to weekly activities for your kids full of learning and fun!",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 20,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
                onPressed: () {},
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Learn More', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600)),
                    Icon(Icons.arrow_forward, color: Colors.black, size: 25),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
