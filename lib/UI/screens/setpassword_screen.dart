import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_maneger/UI/widgets/screen_background.dart';
import 'package:task_maneger/controller/auth_controller.dart';
import 'package:task_maneger/data/model/api_response.dart';
import 'package:task_maneger/data/model/user_model.dart';
import 'package:task_maneger/data/service/api_caller.dart';
import 'package:task_maneger/utils/app_color.dart';
import 'package:task_maneger/utils/urls.dart';

import 'login_screen.dart';

// class name change korte hbe
class SetPasswordScreen extends StatefulWidget {
  final String email;
  final String otp;

  const SetPasswordScreen({super.key, required this.email, required this.otp});

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {

  TextEditingController newPasswordController = TextEditingController();
  // TextEditingController confirmPassController = TextEditingController();

  final _setPinKey = GlobalKey<FormState>();

  Future<void>updatePassword()async{
    Map<String, dynamic>requestBody ={
      "email":widget.email,
      "OTP": widget.otp,
      "password":newPasswordController.text.trim()
    };
    ApiResponse response = await ApiCaller.postRequest(URL: Urls.recoveryPassword, body: requestBody);
    if(response.isSuccess){
      print(response.responseData['data'].toString());
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.responseData['data'])));
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: ScreenBackground(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(40),
              child: Form(
                key: _setPinKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 100.h),
                    Text(
                      'Set Password',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      'Minimum length password 6 character with Latter and number combination',
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 12.h),

                    //new password
                    TextFormField(
                      controller: newPasswordController,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(hintText: 'New Password'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required';
                        } else if (value.length < 6) {
                          return 'Password must be at least 8 characters';
                        }
                        return null;
                      },
                    ),



                    SizedBox(height: 10.h),

                    // confirm password
                    // TextFormField(
                    //   controller: confirmPassController,
                    //   obscureText: true,
                    //   keyboardType: TextInputType.visiblePassword,
                    //   decoration: InputDecoration(hintText: 'Confirm Password'),
                    //   validator: (value) {
                    //     if (value == null || value.isEmpty) {
                    //       return 'Password is required';
                    //     } else if (value.length < 6) {
                    //       return 'Password must be at least 8 characters';
                    //     } else if (value != newPasswordController.text) {
                    //       // ✅ FIXED HERE
                    //       return "Passwords don't match";
                    //     }
                    //     return null;
                    //   },
                    // ),

                    SizedBox(height: 13.h),

                    // filled button
                    FilledButton(
                      onPressed: () {

                          updatePassword();

                      },

                      child: Text('Confirm', style: TextStyle()),
                    ),

                    SizedBox(height: 30.h),
                    Center(
                      child: Column(
                        children: [
                          RichText(
                            text: TextSpan(
                              text: "Have account? ",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w800,
                                fontSize: 12.sp,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Sign in',
                                  style: TextStyle(
                                    color: AppColor.primeryColor,
                                    fontSize: 12.sp,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => LoginScreen(),
                                        ),
                                      );
                                    },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
