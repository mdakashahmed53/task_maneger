import 'package:flutter/material.dart';
import 'package:task_maneger/data/model/api_response.dart';
import 'package:task_maneger/data/service/api_caller.dart';
import 'package:task_maneger/utils/urls.dart';

class DeleteTaskProvider extends ChangeNotifier {
  Future<bool> deleteTask(String id) async {
    bool isSuccess = false;
    notifyListeners();

    final ApiResponse response = await ApiCaller.getRequest(
      URL: Urls.taskDelete(id),
    );

    if (response.isSuccess) {
      isSuccess = true;
      notifyListeners();
    } else {
      isSuccess = false;
      notifyListeners();
    }

    return isSuccess;
  }
}
