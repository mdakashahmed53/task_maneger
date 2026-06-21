import 'package:flutter/material.dart';
import 'package:task_maneger/data/model/api_response.dart';
import 'package:task_maneger/data/service/api_caller.dart';
import 'package:task_maneger/utils/urls.dart';

class ChangeStatusProvider extends ChangeNotifier {
  Future<bool> changeStatus(String id, String status) async {
    bool isSuccess = false;
    notifyListeners();
    final ApiResponse response = await ApiCaller.getRequest(
      URL: Urls.updateTaskStatus(id, status),
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
