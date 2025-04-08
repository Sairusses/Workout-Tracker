import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:workout_tracker/components/workout_card.dart';
import 'package:workout_tracker/models/workout_model.dart';

import '../components/edit_workout.dart';
import '../components/workout_dialog.dart';
import '../components/custom_text_widgets.dart';
import '../db_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}
class HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin{
  final db = DBHelper();
  List<Workout> workouts = [];


  @override
  void initState() {
    _loadWorkouts();
    super.initState();
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
      body: workouts.isEmpty
          ? const Center(child: MediumText(text: 'No workouts yet.', color: Colors.black87),)
          : ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: workouts.length,
        itemBuilder: (context, index) {
          return Slidable(
            key: ValueKey(index),
            endActionPane: ActionPane(
                motion: DrawerMotion(),
                children: [
                  SlidableAction(
                    onPressed: (context) async {
                      await showDialog(context: context, builder: (context) => EditWorkout(workout: workouts[index]));
                      _loadWorkouts();
                    },
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.black54,
                    icon: Icons.edit,
                    label: "Edit",
                  ),
                  SlidableAction(
                    onPressed: (context) async {
                      await db.deleteWorkout(workouts[index]);
                      _loadWorkouts();
                    },
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.red,
                    icon: Icons.delete,
                    label: "Delete",
                  ),
                ]
            ),
            child: WorkoutCard(workout: workouts[index].toMap())
          );
        },
      ),
      backgroundColor: Colors.grey[100],
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final added = await showDialog(
            context: context,
            builder: (context) => const WorkoutDialog(),
          );
          if (added != null && added is Workout) {
            _loadWorkouts(); // reload workouts
          }
        },
        backgroundColor: Colors.black87,
        elevation: 4,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
