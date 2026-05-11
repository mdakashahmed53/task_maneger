import 'package:flutter/material.dart';
import 'package:task_maneger/UI/widgets/screen_background.dart';
import 'package:task_maneger/utils/app_color.dart';

import '../../data/model/task_model.dart';
import '../widgets/task_card.dart';

class CompleteTaskScreen extends StatefulWidget {
  const CompleteTaskScreen({super.key});

  @override
  State<CompleteTaskScreen> createState() => _CompleteTaskScreenState();
}

class _CompleteTaskScreenState extends State<CompleteTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(child: Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context , index){
                return TaskCard(taskModel: TaskModel(id: 04, title: 'Complete Demo Task Title', description: "Complete Demo task description s simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled", date: '02/09/2035', status: 'Complete'), statusColor: AppColor.primeryColor, refreshParent: () {  },);

              }),
        ),
      )),
    );
  }
}
