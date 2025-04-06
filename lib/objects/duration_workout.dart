import 'package:workout_tracker/objects/workout.dart';

class DurationWorkout extends Workout {
  final int duration;

  DurationWorkout({
    super.id,
    required super.title,
    required this.duration,
    required super.date,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'duration': duration,
      'date': date.toIso8601String(),
      'type': workoutType,
    };
  }

  @override
  String get workoutType => 'duration';
  

  factory DurationWorkout.fromMap(Map<String, dynamic> map) {
    return DurationWorkout(
      id: map['id'],
      title: map['title'],
      duration: map['duration'],
      date: DateTime.parse(map['date']),
    );
  }
}
