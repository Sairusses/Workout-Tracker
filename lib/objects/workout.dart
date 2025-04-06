abstract class Workout {
  final int? id;
  final String title;
  final DateTime date;
  final int sets;

  Workout({
    this.id,
    required this.title,
    required this.date,
    required this.sets,
  });

  Map<String, dynamic> toMap();
  String get workoutType;
}
