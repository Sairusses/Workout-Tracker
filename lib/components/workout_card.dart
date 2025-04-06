import 'package:flutter/material.dart';

import '../objects/duration_workout.dart';
import '../objects/reps_workout.dart';
import '../objects/workout.dart';

class WorkoutCard extends StatelessWidget{
  final Map<String, dynamic> workoutMap;
  const WorkoutCard({super.key, required this.workoutMap});

  Workout workoutFromMap(Map<String, dynamic> map) {
    switch (map['type']) {
      case 'reps':
        return RepsWorkout.fromMap(map);
      case 'duration':
        return DurationWorkout.fromMap(map);
      default:
        throw Exception('Unknown workout type');
    }
  }

  @override
  Widget build(BuildContext context) {
    final Workout workout = workoutFromMap(workoutMap);

    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(
          workout.workoutType == 'reps' ? Icons.fitness_center : Icons.timer,
          color: Colors.black
        ),
        title: Text(workout.title),
        subtitle: workout is RepsWorkout
            ? Text('${workout.reps} reps, ${workout.sets} sets')
            : workout is DurationWorkout
            ? Text('${(workout).duration} minutes, ${workout.sets} sets')
            : const Text('Unknown workout'),
        trailing: Text(
          '${workout.date.day}/${workout.date.month}/${workout.date.year}',
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ),
    );
  }
}