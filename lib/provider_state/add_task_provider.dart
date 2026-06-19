import 'package:flutter/material.dart';
import 'package:task_maneger/data/model/api_response.dart';
import 'package:task_maneger/data/service/api_caller.dart';
import 'package:task_maneger/utils/urls.dart';

class AddTaskProvider extends ChangeNotifier{

  Future<bool>addTask(String title, String description,)async{
    bool isSuccess = false;
    notifyListeners();

    Map<String, dynamic> requestBody = {
      "title": title,
      "description": description,
      "status": "New",
    };

    ApiResponse response = await ApiCaller.postRequest(URL: Urls.createTask, body: requestBody);


    if(response.isSuccess){
      isSuccess = true;
      notifyListeners();
    } else {
      isSuccess = false;
      notifyListeners();
    }

    return isSuccess;
  }
}