import 'package:intl/intl.dart';
import 'package:townsquare_app/model/activities_event_model.dart';

class EventDetails {
  List<ActivitiesEventModel> eventDatas = [
    ActivitiesEventModel(
      id: 1,
      time: DateTime.now(), // Today's date and current time
      title: "Morning Yoga",
      location: "Community Hall A",
      availableSpots: 20,
      price: 15.00,
      duration: "60 min",
      tags: ["light"],
      category: "Sports",
    ),
    ActivitiesEventModel(
      id: 2,
      time: DateTime.now().add(Duration(hours: 3)), // Today, 3 hours later
      title: "Team Meeting",
      location: "Tech Hub",
      availableSpots: 12,
      price: 0.00, // Free event
      duration: "60 min",
      tags: ["medium", "childcare"],
      category: "Creative",
    ),
    ActivitiesEventModel(
      id: 3,
      time: DateTime.now().add(Duration(hours: 6)), // Today, 6 hours later
      title: "Cooking Demo",
      location: "Downtown Kitchen Studio",
      availableSpots: 8,
      price: 40.00,
      duration: "60 min",
      tags: ["high", "childcare"],
      category: "Food",
    ),
    ActivitiesEventModel(
      id: 4,
      time: DateTime.now().add(Duration(hours: 9)), // Today, 9 hours later
      title: "Evening Jazz Night",
      location: "The Velvet Lounge",
      availableSpots: 50,
      price: 25.00,
      duration: "60 min",
      tags: ["light"],
      category: 'Creative',
    ),
    ActivitiesEventModel(
      id: 5,
      time: DateTime.now().add(Duration(days: 1)), // Today, 9 hours later
      title: "Watching Animation Movie",
      location: "The Velvet Theater",
      availableSpots: 40,
      price: 25.00,
      duration: "120 min",
      tags: ["light"],
      category: 'Kids',
    ),
  ];

  Map<String, List<ActivitiesEventModel>> groupEventsByDate(Set<String> selectedCategoryNames) {
    Map<String, List<ActivitiesEventModel>> groupedEvents = {};

    if (selectedCategoryNames.isEmpty) {
      return groupedEvents; // No events should be shown if no category is selected
    }

    for (var event in eventDatas) {
      // String date = DateFormat('yyyy-MM-dd').format(event.time); // Group by date only (no time)
      // if (!groupedEvents.containsKey(date)) {
      //   groupedEvents[date] = [];
      // }
      // groupedEvents[date]?.add(event);
      if (selectedCategoryNames.isEmpty || selectedCategoryNames.contains(event.category)) {
        String date = DateFormat('yyyy-MM-dd').format(event.time); // Group by date only (no time)
        if (!groupedEvents.containsKey(date)) {
          groupedEvents[date] = [];
        }
        groupedEvents[date]?.add(event);
      }
    }
    return groupedEvents;
  }
}
