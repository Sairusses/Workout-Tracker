import 'package:flutter/material.dart';
import 'package:workout_tracker/components/workout_card.dart';
import 'package:workout_tracker/models/workout_model.dart';

import '../components/add_workout_dialog.dart';
import '../components/custom_text_widgets.dart';
import '../db_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}
class HomeScreenState extends State<HomeScreen> {
  final db = DBHelper();
  List<Workout> workouts = [];

  @override
  void initState() {
    super.initState();
    _loadWorkouts();
  }

  Future<void> _loadWorkouts() async {
    final data = await db.getWorkouts();
    setState(() {
      workouts = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final added = await showDialog(
            context: context,
            builder: (context) => const AddWorkoutDialog(),
          );
          if (added != null && added is Workout) {
            _loadWorkouts(); // reload workouts
          }
        },
        backgroundColor: Colors.black87,
        elevation: 4,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: workouts.isEmpty
          ? const Center(
        child: MediumText(text: 'No workouts yet.', color: Colors.black87),
      )
          : ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: workouts.length,
        itemBuilder: (context, index) {
          return WorkoutCard(workout: workouts[index].toMap());
        },
      ),
    );
  }
}
