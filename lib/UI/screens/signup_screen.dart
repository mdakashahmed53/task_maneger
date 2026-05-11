import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:task_maneger/UI/screens/login_screen.dart';
import 'package:task_maneger/UI/widgets/screen_background.dart';
import 'package:task_maneger/data/model/api_response.dart';
import 'package:task_maneger/data/service/api_caller.dart';
import 'package:task_maneger/utils/app_color.dart';
import 'package:http/http.dart' as http;
import 'package:task_maneger/utils/urls.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController fristNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  final singUpkey = GlobalKey<FormState>();

  // Future<void>singUp()async{
  //   final response = await http.post(Uri.parse(Urls.Registration),
  //       headers: {
  //         'Content-Type': 'application/json',
  //       },
  //       body: jsonEncode(
  //           {
  //             "email":emailController.text.trim(),
  //             "firstName":fristNameController.text.trim(),
  //             "lastName":lastNameController.text.trim(),
  //             "mobile":phoneController.text.trim(),
  //             "password":newPasswordController.text.trim()
  //           }
  //       )
  //   );
  //   print(response.statusCode);
  //
  //   if (response.statusCode == 200) {
  //     final data = jsonDecode(response.body);
  //     print(data);
  //
  //     // ScaffoldMessenger.of(context).showSnackBar(
  //     //   SnackBar(content: Text('Sign up successful')),
  //     // );
  //     _showSingUpAlert();
  //     goLoginPage();
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Sign up failed')),
  //     );
  //   }
  // }

  Future<void>signUp()async{
    Map<String,dynamic>requestBody = {
      "email":emailController.text.trim(),
      "firstName":fristNameController.text,
      "lastName":lastNameController.text,
      "mobile":phoneController.text.trim(),
      "password":newPasswordController.text.trim()
    };

    final ApiResponse response = await ApiCaller.postRequest(URL: Urls.Registration,
    body: requestBody,
    );

    if(response.isSuccess){
      _showSingUpAlert();
      goLoginPage();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('This email is already registered!')));
    }

  }



  Future<void>goLoginPage()async{
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
  }
  
  // alert dialog
  
  void _showSingUpAlert(){
    showDialog(context: context, builder: (context){
      return AlertDialog(

        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset('assets/anim/done.json', height: 200),
            Text('Successful', style: GoogleFonts.lobster(
              fontSize: 30
            ),)
          ],
        ),
      );
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: ScreenBackground(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: singUpkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 40.h),
                    InkWell(
                      onTap: (){
                        _showSingUpAlert();
                      },
                      child: Text(
                        'Join With Us',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),

                    SizedBox(height: 15.h),

                    // person name
                    TextFormField(
                      controller: fristNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'name is required';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(hintText: 'First Name'),
                    ),

                    SizedBox(
                      height: 10.h,
                    ),
                    TextFormField(
                      controller: lastNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'name is required';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(hintText: 'Last Name'),
                    ),

                    SizedBox(height: 10.h),

                    // phone number
                    TextFormField(
                      controller: phoneController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'phone number is required';
                        } else if (!value.contains('01')) {
                          return 'must be valid phone';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(hintText: 'Mobile'),
                    ),

                    SizedBox(height: 10.h),

                    // email address
                    TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'email is required';
                        } else if (!value.contains('@')) {
                          return 'must be valid email';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(hintText: 'Email'),
                    ),

                    SizedBox(height: 10.h),

                    // new password
                    TextFormField(
                      controller: newPasswordController,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      decoration:
                      const InputDecoration(hintText: 'New Password'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required';
                        } else if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 10.h),

                    // confirm password
                    TextFormField(
                      controller: confirmPassController,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      decoration:
                      const InputDecoration(hintText: 'Confirm Password'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required';
                        } else if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        } else if (value != newPasswordController.text) {
                          return "Passwords don't match";
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 12.h),

                    // submit button
                    FilledButton(
                      onPressed: () {
                        if (singUpkey.currentState!.validate()) {

                          // ScaffoldMessenger.of(context).showSnackBar(
                          //   const SnackBar(content: Text('Sign Up ')),
                          // );

                          signUp();

                        }
                      },
                      child: const Icon(
                        Icons.arrow_circle_right_outlined,
                        size: 25,
                      ),
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
                                          builder: (context) =>
                                              LoginScreen(),
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

  @override
  void dispose() {
    // TODO: implement dispose
    fristNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    newPasswordController.dispose();
    super.dispose();
  }
}