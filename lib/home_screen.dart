import 'package:flutter/material.dart';
import 'package:workout_tracker/components/workout_card.dart';

import 'components/add_workout_dialog.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog(context: context, builder: (context) => const AddWorkoutDialog());
        },
        backgroundColor: Colors.black87,
        elevation: 4,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: Center(
        child: WorkoutCard(workoutMap: <String, dynamic>{
          'id': 1,
          'title': 'Push-ups',
          'reps': 10,
          'sets': 4,
          'date': DateTime.now().toString(),
          'type': 'reps',
        }),
      ),
    );
  }
}