import 'package:flutter/material.dart';
import 'package:task_maneger/UI/widgets/screen_background.dart';

import '../../data/model/task_model.dart';
import '../widgets/task_card.dart';

class ProgressTaskScreen extends StatefulWidget {
  const ProgressTaskScreen({super.key});

  @override
  State<ProgressTaskScreen> createState() => _ProgressTaskScreenState();
}

class _ProgressTaskScreenState extends State<ProgressTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(child: Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context , index){
                return TaskCard(taskModel: TaskModel(id: 04, title: 'Progress Task Title', description: 'Progress demo task description in my app, Lorem Text', date: '01/04/2035', status: 'Pending'), statusColor: Colors.purple, refreshParent: () {  },);

              }),
        ),
      )),
    );
  }
}
