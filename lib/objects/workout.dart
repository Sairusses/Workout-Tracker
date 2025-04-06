abstract class Workout {
  final int? id;
  final String title;
  final DateTime date;

  Workout({
    this.id,
    required this.title,
    required this.date,
  });

  Map<String, dynamic> toMap();
  String get workoutType;
}
