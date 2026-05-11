import 'dart:convert';

import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:task_maneger/controller/auth_controller.dart';
import 'package:task_maneger/data/model/api_response.dart';

class ApiCaller{
  static final Logger _logger = Logger();

  // data get

  static Future<ApiResponse> getRequest({required URL})async{
    _logger.i(URL);
    Response response = await get(Uri.parse(URL),
    headers: {
      'token':AuthController.accessToken ?? '',
    }

    );
    _logger.i(response.statusCode);
    _logger.i(response.body);
    // working now here >>>>>>

    if(response.statusCode == 200){
      return ApiResponse(responseCode: response.statusCode, responseData: jsonDecode(response.body), isSuccess: true);
    } else {
      return ApiResponse(responseCode: response.statusCode, responseData: jsonDecode(response.body), isSuccess: false);
    }

  }

  // data send

  static Future<ApiResponse>postRequest({required String URL, Map<String, dynamic>? body})async{
    Response response = await post(Uri.parse(URL),

    headers: {
      "Content-Type":"application/json",
      "Accept":"application/json",
      'token':AuthController.accessToken ?? ''
    },

      body: body != null ? jsonEncode(body): null);
    _logger.i(URL);
    _logger.i(response.statusCode);
    _logger.i(response.body);

    if(response.statusCode == 200 || response.statusCode == 201){
      return ApiResponse(responseCode: response.statusCode, responseData: jsonDecode(response.body), isSuccess: true);
    } else {
      return ApiResponse(responseCode: response.statusCode, responseData: jsonDecode(response.body),errorMessage: jsonDecode(response.body), isSuccess: false);
    }

  }


  }