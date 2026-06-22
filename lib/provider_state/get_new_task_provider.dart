import 'package:flutter/material.dart';
import 'package:task_maneger/data/model/api_response.dart';
import 'package:task_maneger/data/model/task_model.dart';
import 'package:task_maneger/data/service/api_caller.dart';
import 'package:task_maneger/utils/urls.dart';

class GetNewTaskProvider extends ChangeNotifier {

  List<TaskModel> allTasks = [];

  Future<bool> getAllNewTask() async {
    bool isSuccess = false;
    notifyListeners();

    final ApiResponse response = await ApiCaller.getRequest(
      URL: Urls.taskByStatus('New'),
    );

    List<TaskModel> task = [];

    if (response.isSuccess) {

      for(Map<String, dynamic> jsonTask in response.responseData['data']){
        task.add(TaskModel.fromJson(jsonTask));
        
        allTasks = task;
        isSuccess = true;


      }
    }else {
      isSuccess = false;

    }



    return isSuccess;
  }
}
