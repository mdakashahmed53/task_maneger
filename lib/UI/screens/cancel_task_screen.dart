import 'package:flutter/material.dart';
import 'package:task_maneger/UI/widgets/screen_background.dart';

import '../../data/model/task_model.dart';
import '../widgets/task_card.dart';

class CancelTaskScreen extends StatefulWidget {
  const CancelTaskScreen({super.key});

  @override
  State<CancelTaskScreen> createState() => _CancelTaskScreenState();
}

class _CancelTaskScreenState extends State<CancelTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Expanded(
          child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context , index){
                return TaskCard(taskModel: TaskModel(id: 04, title: 'Demo Task Title', description: 'Demo task description', date: '02/04/2035', status: 'Cancel'), statusColor: Colors.red, refreshParent: () {  },);

              }),
        ),
      )),
    );
  }
}
