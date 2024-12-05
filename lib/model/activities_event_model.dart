class ActivitiesEventModel {
  final int id;
  final DateTime time; // DateTime for Time & Duration
  final String title; // Title of the event
  final String location; // Location of the event
  final int availableSpots; // Number of available spots
  final double price; // Price of the event
  final String duration;
  final List<String> tags;
  final String category;

  ActivitiesEventModel({
    required this.id,
    required this.time,
    required this.title,
    required this.location,
    required this.availableSpots,
    required this.price,
    required this.duration,
    required this.tags,
    required this.category,
  });

  // Factory constructor for creating an ActivitiesEventModel from JSON
  factory ActivitiesEventModel.fromJson(Map<String, dynamic> json) {
    return ActivitiesEventModel(
      id: json['id'],
      time: DateTime.parse(json['time']),
      title: json['title'],
      location: json['location'],
      availableSpots: json['availableSpots'],
      price: json['price'].toDouble(),
      duration: json['duration'],
      tags: json['tags'],
      category: json['category'],
    );
  }

  // Convert ActivitiesEventModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'time': time.toIso8601String(),
      'title': title,
      'location': location,
      'availableSpots': availableSpots,
      'price': price,
      'duration': duration,
      'tags': tags,
      'category': category,
    };
  }
}
