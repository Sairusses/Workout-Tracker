import 'package:flutter/material.dart';
import 'package:workout_tracker/screens/calendar_screen.dart';
import 'package:workout_tracker/screens/home_screen.dart';

class Home extends StatefulWidget{
  const Home({super.key});
  @override
  State<Home> createState() => HomeState();
}
class HomeState extends State<Home>{
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.white,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        indicatorColor: Colors.grey[100],
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home, color: Colors.black,),
            icon: Icon(Icons.home_outlined, color: Colors.black),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.calendar_month_rounded, color: Colors.black),
            icon: Icon(Icons.calendar_month_outlined, color: Colors.black),
            label: 'Calendar',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.fitness_center_rounded, color: Colors.black),
            icon: Icon(Icons.fitness_center_outlined, color: Colors.black),
            label: 'Sets',
          ),
        ]
      ),
      body: <Widget>[
        const HomeScreen(),
        const CalendarScreen(),
        const Center(child: Text('Sets')),
      ][currentPageIndex],
    );
  }
  
}