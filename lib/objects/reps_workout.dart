import 'package:workout_tracker/objects/workout.dart';

class RepsWorkout extends Workout {
  final int reps;

  RepsWorkout({
    super.id,
    required super.title,
    required this.reps,
    required super.date,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'reps': reps,
      'date': date.toIso8601String(),
      'type': workoutType,
    };
  }

  @override
  String get workoutType => 'reps';

  factory RepsWorkout.fromMap(Map<String, dynamic> map) {
    return RepsWorkout(
      id: map['id'],
      title: map['title'],
      reps: map['reps'],
      date: DateTime.parse(map['date']),
    );
  }
}
