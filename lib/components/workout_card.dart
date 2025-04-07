import 'package:flutter/material.dart';

class WorkoutCard extends StatelessWidget{
  final Map<String, dynamic>? workout;
  const WorkoutCard({super.key, required this.workout});

  @override
  Widget build(BuildContext context) {

    DateTime date = DateTime.parse(workout?['date']);

    if (workout == null) {
      return const Card(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: ListTile(
          leading: Icon(Icons.warning, color: Colors.red),
          title: Text('Unknown workout type'),
          subtitle: Text('Please check the data.'),
        ),
      );
    }

    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(
          workout?['type'] == 'reps' ? Icons.fitness_center : Icons.timer,
          color: Colors.black,
        ),
        title: Text(workout?["title"]),
        subtitle: workout?['type'] == 'reps'
            ? Text('${workout?['reps']} reps, ${workout?['sets']} sets')
            : workout?['type'] == 'duration'
            ? Text('${workout?['duration']} minutes, ${workout?['sets']} sets')
            : const Text('Unknown workout'),
        trailing: Text(
          '${date.day}/${date.month}/${date.year}',
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ),
    );
  }

}