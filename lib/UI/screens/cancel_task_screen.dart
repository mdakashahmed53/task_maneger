import 'package:flutter/material.dart';
import 'package:task_maneger/UI/widgets/screen_background.dart';
import 'package:task_maneger/data/model/api_response.dart';
import 'package:task_maneger/data/service/api_caller.dart';
import 'package:task_maneger/utils/urls.dart';

import '../../data/model/task_model.dart';
import '../widgets/task_card.dart';

class CancelTaskScreen extends StatefulWidget {
  const CancelTaskScreen({super.key});

  @override
  State<CancelTaskScreen> createState() => _CancelTaskScreenState();
}

class _CancelTaskScreenState extends State<CancelTaskScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllTask();
  }

  List<TaskModel> allTasks = [];

  Future<void>getAllTask()async{
    final ApiResponse response = await ApiCaller.getRequest(URL: Urls.taskByStatus('Cancel'));

    List<TaskModel> tasks = [];

    if(response.isSuccess){
      for(Map<String, dynamic>fromJson in response.responseData['data']){
        tasks.add(TaskModel.fromJson(fromJson));
      }
    }else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.responseData)));
    }

    setState(() {
      allTasks = tasks;
    });

    print(response.responseData);

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Expanded(
          child: ListView.builder(
              itemCount: allTasks.length,
              itemBuilder: (context , index){
                return TaskCard(taskModel: allTasks[index], statusColor: Colors.red, refreshParent: () { getAllTask(); },);

              }),
        ),
      )),
    );
  }
}
