import 'dart:convert';

import 'package:task_maneger/data/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:logger/logger.dart';

class AuthController{
  static String ? accessToken;
  static UserModel ? userData;
  static final Logger _logger = Logger();

  static Future saveUserData(UserModel userModel, String token)async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    
    await sharedPreferences.setString('token', token);
    await sharedPreferences.setString('user-data', jsonEncode(userModel.toJson()));

    accessToken = token;
    userData = userModel;
  }


  static Future<bool>isUserLogIn()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString('token');

    return token != null;
  }

  static Future<void>getUserData()async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String ? token = sharedPreferences.getString('token');

    if(token != null){
      accessToken = token;
    }

    String? user =  sharedPreferences.getString('user-data');
    if(user != null && user.isNotEmpty){
      userData = UserModel.fromJson(jsonDecode(user));
    }

    _logger.i(accessToken);
    _logger.i(userData);


  }



}

