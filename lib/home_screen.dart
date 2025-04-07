import 'package:flutter/material.dart';
import 'package:workout_tracker/components/workout_card.dart';
import 'package:workout_tracker/workout_model.dart';

import 'components/add_workout_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    initFuture();
  }

  Future<void> initFuture() async {

  }

  @override
  Widget build(BuildContext context) {
    Workout workout = Workout(
      id: 1,
      title: 'Test Workout',
      type: 'reps',
      reps: 10,
      sets: 3,
      date: DateTime.now(),
      duration: 0,
    );
    final workoutMap = workout.toMap();


    return Scaffold(
      backgroundColor: Colors.grey[100],
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final added = await showDialog(
            context: context,
            builder: (context) => const AddWorkoutDialog(),
          );
          if (added != null) initFuture();
        },
        backgroundColor: Colors.black87,
        elevation: 4,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: Center(
        child: WorkoutCard(workout: workoutMap),
      )
    );
  }
}
