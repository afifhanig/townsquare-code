import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import this package for date formatting

class EventCardWidget extends StatelessWidget {
  final DateTime time;
  final String duration;
  final String title;
  final String location;
  final int availableSpots;
  final double price;
  final List<String> tags;

  const EventCardWidget({
    Key? key,
    required this.time,
    required this.duration,
    required this.title,
    required this.location,
    required this.availableSpots,
    required this.price,
    required this.tags,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Format the DateTime for display
    String formattedTime = DateFormat('HH:mm').format(time);

    return Card(
      //margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      //color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 12,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Time and duration row
            Row(
              children: [
                Text(
                  formattedTime,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  "($duration)",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),

            // Title and price row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "$price€",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),

            // Location
            Row(
              children: [
                Icon(Icons.location_on_outlined, size: 16, color: Colors.grey),
                SizedBox(width: 4),
                Text(
                  location,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),

            // Spots and Join button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                    child: FittedBox(
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Color(0xFFF1F1F1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.person_3_outlined, size: 16, color: Colors.grey),
                            SizedBox(width: 4),
                            Text(
                              "$availableSpots spots left",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 8),
                      ...tags.map((tag) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: _tagsBgColor(tag),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              tag,
                              style: TextStyle(
                                fontSize: 12,
                                color: _tagsTxtColor(tag),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ],
                  ),
                )),
                SizedBox(width: 8.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    // Add your join logic here
                  },
                  child: Text(
                    "Join",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color _tagsBgColor(String tags) {
    switch (tags) {
      case 'light':
        return const Color(0xFFD5F1FF);
      case 'medium':
        return const Color(0xFFF3E8FF);
      case 'childcare':
        return const Color(0xFFD8F7DF);
      case 'high':
        return const Color(0xFFFFEAD1);
      default:
        return Colors.grey.shade200;
    }
  }

  Color _tagsTxtColor(String tags) {
    switch (tags) {
      case 'light':
        return const Color(0xFF65B5DB);
      case 'medium':
        return const Color(0xFFC9A4F2);
      case 'childcare':
        return const Color(0xFF8AB58A);
      case 'high':
        return const Color(0xFFDC974F);
      default:
        return Colors.grey.shade600;
    }
  }
}
