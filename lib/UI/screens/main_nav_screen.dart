import 'package:flutter/material.dart';
import 'package:task_maneger/UI/screens/cancel_task_screen.dart';
import 'package:task_maneger/UI/screens/complete_task_screen.dart';
import 'package:task_maneger/UI/screens/new_task_screen.dart';
import 'package:task_maneger/UI/screens/progress_task_screen.dart';
import 'package:task_maneger/UI/widgets/tm_appbar.dart';

class MainNavScreen extends StatefulWidget {
  const MainNavScreen({super.key});

  @override
  State<MainNavScreen> createState() => _MainNavScreenState();
}

class _MainNavScreenState extends State<MainNavScreen> {
  int _seletedIndex = 0;

  List _screen = [
    NewTaskScreen(),
    ProgressTaskScreen(),
    CompleteTaskScreen(),
    CancelTaskScreen()
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TmAppBar()

      ,
      body: _screen[_seletedIndex],
      bottomNavigationBar: NavigationBar(
          selectedIndex: _seletedIndex,
          onDestinationSelected: (int index){
            setState(() {
              _seletedIndex = index;
            });
          },

          destinations: [
        NavigationDestination(icon: Icon(Icons.task), label: 'New Task'),
        NavigationDestination(icon: Icon(Icons.refresh), label: 'Progress'),
        NavigationDestination(icon: Icon(Icons.task_alt_outlined), label: 'Complete'),
        NavigationDestination(icon: Icon(Icons.cancel), label: 'Cancel'),
      ]),
    );
  }
}
