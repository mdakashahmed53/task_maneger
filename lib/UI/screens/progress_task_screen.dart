import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:task_maneger/UI/widgets/screen_background.dart';
import 'package:task_maneger/data/model/api_response.dart';
import 'package:task_maneger/data/service/api_caller.dart';
import 'package:task_maneger/utils/urls.dart';

import '../../data/model/task_model.dart';
import '../widgets/task_card.dart';

class ProgressTaskScreen extends StatefulWidget {
  const ProgressTaskScreen({super.key});

  @override
  State<ProgressTaskScreen> createState() => _ProgressTaskScreenState();
}

class _ProgressTaskScreenState extends State<ProgressTaskScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllTask();
  }

  List<TaskModel> allTasks = [];

  Future<void> getAllTask() async {
    final ApiResponse response = await ApiCaller.getRequest(
      URL: Urls.taskByStatus('Progress'),
    );

    List<TaskModel> tasks = [];

    if (response.isSuccess) {
      for (Map<String, dynamic> fromJson in response.responseData['data']) {
        tasks.add(TaskModel.fromJson(fromJson));
      }
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(response.responseData['data'])));
    }

    setState(() {
      allTasks = tasks;
    });

    print(response.responseData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: allTasks.length,
              itemBuilder: (context, index) {
                return TaskCard(
                  taskModel: allTasks[index],
                  statusColor: Colors.purple,
                  refreshParent: () {
                    getAllTask();
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
