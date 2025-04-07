class Workout {
  final int id;
  final String title;
  final String type;
  final int reps;
  final int sets;
  final int duration;
  final DateTime date;
  const Workout({
    required this.id,
    required this.title,
    required this.type,
    required this.reps,
    required this.sets,
    required this.duration,
    required this.date
  });
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'type': type,
      'reps': reps,
      'sets': sets,
      'duration': duration,
      'date': date.toIso8601String(),
    };
  }
}