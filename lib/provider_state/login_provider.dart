import 'package:flutter/material.dart';

import '../controller/auth_controller.dart';
import '../data/model/api_response.dart';
import '../data/model/user_model.dart';
import '../data/service/api_caller.dart';
import '../utils/urls.dart';

class LogInProvider extends ChangeNotifier {

  Future<bool>signIn(String email, String password)async{
    bool isSuccess = false;
    notifyListeners();
    Map<String,dynamic> requestBody = {
      "email":email,
      "password":password
    };

    final ApiResponse response = await ApiCaller.postRequest(URL: Urls.Login, body: requestBody);


    if(response.isSuccess){

      UserModel model = UserModel.fromJson(response.responseData['data']);
      String accessToken = response.responseData['token'];

      // user data & token save kora hoiche
      AuthController.saveUserData(model, accessToken);
      await AuthController.getUserData();
      isSuccess = true;
     notifyListeners();
    } else {
      isSuccess = false;
      notifyListeners();
    }

    return isSuccess;

  }

}