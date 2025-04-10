import 'package:flutter/material.dart';
import 'package:workout_tracker/components/workout_card.dart';
import 'package:workout_tracker/models/workout_model.dart';
import '../db_helper.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> with TickerProviderStateMixin {
  final db = DBHelper();
  late TabController _tabController;
  List<List<Workout>> weeklyWorkouts = List.generate(7, (_) => []);

  final List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

  @override
  void initState() {
    super.initState();
    int todayIndex = DateTime.now().weekday - 1;
    _tabController = TabController(length: 7, vsync: this, initialIndex: todayIndex);
    _loadWeeklyWorkouts();
  }

  Future<void> _loadWeeklyWorkouts() async {
    final today = DateTime.now();
    final startOfWeek = today.subtract(Duration(days: today.weekday - 1));

    for (int i = 0; i < 7; i++) {
      final date = startOfWeek.add(Duration(days: i));
      final workouts = await db.getWorkoutsByDate(date);
      weeklyWorkouts[i] = workouts;
    }

    setState(() {});
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Week View"),
        backgroundColor: Colors.white,
        elevation: 2,
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          indicatorColor: Colors.black,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          tabs: days.map((day) => Tab(text: day)).toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: List.generate(7, (index) {
          final workouts = weeklyWorkouts[index];
          if (workouts.isEmpty) {
            return const Center(child: Text('No workouts'));
          }
          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: workouts.length,
            itemBuilder: (context, i) {
              return WorkoutCard(workout: workouts[i].toMap());
            },
          );
        }),
      ),
    );
  }
}
