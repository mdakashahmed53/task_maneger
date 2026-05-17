import 'package:flutter/material.dart';
import 'package:task_maneger/UI/widgets/screen_background.dart';
import 'package:task_maneger/data/model/api_response.dart';
import 'package:task_maneger/data/service/api_caller.dart';
import 'package:task_maneger/utils/app_color.dart';
import 'package:task_maneger/utils/urls.dart';

import '../../data/model/task_model.dart';
import '../widgets/task_card.dart';

class CompleteTaskScreen extends StatefulWidget {
  const CompleteTaskScreen({super.key});

  @override
  State<CompleteTaskScreen> createState() => _CompleteTaskScreenState();
}

class _CompleteTaskScreenState extends State<CompleteTaskScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllTask();
  }

  List<TaskModel> allTask = [];
  Future<void>getAllTask()async{
    final ApiResponse response = await ApiCaller.getRequest(URL: Urls.taskByStatus('Complete'));

    List<TaskModel> tasks = [];

    if(response.isSuccess){
      for(Map<String, dynamic> fromJson in response.responseData['data']){
        tasks.add(TaskModel.fromJson(fromJson));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Task Empty')));
    }

    setState(() {
      allTask = tasks;
    });

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(child: Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
              itemCount: allTask.length,
              itemBuilder: (context , index){
                return TaskCard(taskModel: allTask[index], statusColor: AppColor.primeryColor, refreshParent: () { getAllTask(); },);

              }),
        ),
      )),
    );
  }
}
