import 'package:flutter/material.dart';
import 'package:task_maneger/data/model/api_response.dart';
import 'package:task_maneger/data/service/api_caller.dart';
import 'package:task_maneger/utils/urls.dart';

class SignupProvider extends ChangeNotifier{
   Future<bool>singUp(String email, String password, String firstName, String lastName, String mobile )async{
    bool isSuccess = false;
    notifyListeners();

    Map<String, dynamic> requestBody = {
      "email":email,
      "firstName":firstName,
      "lastName":lastName,
      "mobile":mobile,
      "password":password
    };

    final ApiResponse response = await ApiCaller.postRequest(URL: Urls.Registration, body: requestBody);

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