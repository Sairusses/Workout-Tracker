import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:workout_tracker/components/workout_card.dart';
import 'package:workout_tracker/models/workout_model.dart';
import '../components/edit_workout.dart';
import '../db_helper.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  final DBHelper db = DBHelper();
  List<List<Workout>> weeklyWorkouts = List.generate(7, (_) => []);

  final List<String> weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

  @override
  void initState() {
    super.initState();
    int todayIndex = DateTime.now().weekday - 1;
    _tabController = TabController(length: 7, vsync: this, initialIndex: todayIndex);
    _loadWeeklyWorkouts();
  }

  Future<void> _loadWeeklyWorkouts() async {
    for (int i = 0; i < 7; i++) {
      DateTime targetDay = DateTime.now().subtract(Duration(days: DateTime.now().weekday - 1 - i));
      List<Workout> workouts = await db.getWorkoutsByDate(targetDay);
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
      backgroundColor: Colors.grey[100],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(127),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.vertical(bottom: Radius.circular(24)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Workout Calendar",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 12),
                TabBar(
                  tabAlignment: TabAlignment.start,
                  indicatorColor: Colors.black87,
                  isScrollable: true,
                  dividerHeight: 0,
                  controller: _tabController,
                  indicator: const UnderlineTabIndicator(
                    borderSide: BorderSide(width: 3.0, color: Colors.black87),
                    insets: EdgeInsets.symmetric(horizontal: 12.0),
                  ),
                  labelColor: Colors.black87,
                  unselectedLabelColor: Colors.black54,
                  labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
                  tabs: weekdays.map((day) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Tab(text: day),
                  )).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: List.generate(7, (index) {
          final workouts = weeklyWorkouts[index];
          return RefreshIndicator(
            onRefresh: () async {
              await _loadWeeklyWorkouts();
            },
            color: Colors.black,
            child: workouts.isEmpty
                ? ListView(
              children: const [
                SizedBox(height: 100),
                Center(
                  child: Text(
                    'No workouts for this day.',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                ),
              ],
            )
                : ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: workouts.length,
              itemBuilder: (context, i) {
                return Slidable(
                  key: ValueKey(i),
                  endActionPane: ActionPane(
                    motion: const DrawerMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) async {
                          await showDialog(
                            context: context,
                            builder: (context) => EditWorkout(workout: workouts[i]),
                          );
                          await _loadWeeklyWorkouts();
                        },
                        backgroundColor: Colors.transparent,
                        foregroundColor: Colors.black54,
                        icon: Icons.edit,
                        label: "Edit",
                      ),
                      SlidableAction(
                        onPressed: (context) async {
                          await db.deleteWorkout(workouts[i]);
                          await _loadWeeklyWorkouts();
                        },
                        backgroundColor: Colors.transparent,
                        foregroundColor: Colors.red,
                        icon: Icons.delete,
                        label: "Delete",
                      ),
                    ],
                  ),
                  child: WorkoutCard(workout: workouts[i].toMap()),
                );
              },
            ),
          );
        }),
      ),

    );
  }
}
