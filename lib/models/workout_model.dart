class Workout {
  final int? id;
  final String title;
  final String type;
  final int reps;
  final int sets;
  final int duration;
  final DateTime date;
  const Workout({
    this.id,
    required this.title,
    required this.type,
    required this.reps,
    required this.sets,
    required this.duration,
    required this.date
  });
  Map<String, dynamic> toMap() {
    final map = {
      'title': title,
      'type': type,
      'reps': reps,
      'sets': sets,
      'duration': duration,
      'date': date.toIso8601String(),
    };
    if (id != null) {
      map['id'] = id!;
    }
    return map;
  }
  factory Workout.fromMap(Map<String, dynamic> map) {
    return Workout(
      id: map['id'],
      title: map['title'],
      type: map['type'],
      reps: map['reps'],
      sets: map['sets'],
      duration: map['duration'],
      date: DateTime.parse(map['date']),
    );
  }
}