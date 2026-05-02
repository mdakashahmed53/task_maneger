import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_maneger/UI/screens/add_task_screen.dart';
import 'package:task_maneger/UI/widgets/screen_background.dart';
import 'package:task_maneger/UI/widgets/tm_appbar.dart';
import 'package:task_maneger/data/task_model.dart';

import '../widgets/task_card.dart';
import '../widgets/task_count_status_card.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
           children: [
             SizedBox(
               height: 60.h,
               child: ListView.separated(
                   scrollDirection: Axis.horizontal,
                   itemBuilder: (context, index){
                 return TaskCountStatusCard(statusTitle: 'Complete', count: 20,);
               },

                   separatorBuilder: (context, index){
                 return SizedBox(width: 7.w,);
                   },


                   itemCount: 4),
             ),
             SizedBox(
               height: 10,
             ),
             Expanded(
               child: ListView.builder(
                   itemCount: 20,
                   itemBuilder: (context , index){
                     return TaskCard(taskModel: TaskModel(id: 04, title: 'Demo Task Title', description: 'Demo task description', date: '02/04/2035', status: 'New'), statusColor: Colors.blue, refreshParent: () {  },);

                   }),
             )

           ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(15),
        child: FloatingActionButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddTaskScreen()));
        }, child: Icon(Icons.add),),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}



