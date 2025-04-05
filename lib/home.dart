import 'package:flutter/material.dart';

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
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        indicatorColor: Colors.blueGrey,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.calendar_month_rounded),
            icon: Icon(Icons.calendar_month_outlined),
            label: 'Calendar',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.fitness_center_rounded),
            icon: Icon(Icons.fitness_center_outlined),
            label: 'Sets',
          ),
        ]
      ),
      body: <Widget>[
        const Center(child: Text('Home')),
        const Center(child: Text('Calendar')),
        const Center(child: Text('Sets')),
      ][currentPageIndex],
    );
  }
  
}