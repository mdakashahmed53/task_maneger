import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_maneger/UI/screens/forget_screen.dart';
import 'package:task_maneger/UI/screens/main_nav_screen.dart';
import 'package:task_maneger/UI/screens/new_task_screen.dart';
import 'package:task_maneger/UI/screens/signup_screen.dart';
import 'package:task_maneger/UI/widgets/screen_background.dart';
import 'package:task_maneger/utils/app_color.dart';
import 'package:http/http.dart' as http;
import 'package:task_maneger/utils/urls.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _logInKey = GlobalKey<FormState>();
  
  Future<void>logIn()async{
    final response = await http.post(Uri.parse(Urls.Login),
    headers: {
      'Content-Type':'application/json'
    },
      body: jsonEncode(
        {
          "email":emailController.text.trim(),
          "password":passwordController.text.trim()
        }
      )
    );

    print(response.statusCode);

    final data = jsonDecode(response.body);
    if(response.statusCode == 200 && 'status' == 'success'){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>MainNavScreen()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(content: Text('Invalid Email or Password')),
      );
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
              padding: const EdgeInsets.all(30),
              child: Form(
                key: _logInKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 150.h),

                    Text(
                      'Get Started With',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),

                    SizedBox(height: 15.h),
                    // email text field
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'email is required';
                        } else if (!value.contains('@')) {
                          return 'must be valid email';
                        } else {
                          return null;
                        }
                      },
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(hintText: 'Email'),
                    ),
                    SizedBox(height: 12.h),
                    // password field
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'password is required';
                        } else if (value.length < 8) {
                          return 'password must be 8 charecter';
                        } else {
                          return null;
                        }
                      },
                      controller: passwordController,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(hintText: 'Password'),
                    ),

                    SizedBox(height: 12.h),
                    // sign in button
                    FilledButton(
                      onPressed: () {
                        if (_logInKey.currentState!.validate()) {
                          
                          
                          // ScaffoldMessenger.of(
                          //   context,
                          // ).showSnackBar(SnackBar(content: Text('Login ')));
                          logIn();
                          

                          // Navigator.pushReplacement(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => MainNavScreen(),
                          //   ),
                          // );
                        }
                      },
                      child: Icon(Icons.arrow_circle_right_outlined, size: 25),
                    ),

                    SizedBox(height: 30.h),
                    Center(
                      child: Column(
                        children: [
                          // forget button
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ForgetScreen(),
                                ),
                              );
                            },
                            child: Text(
                              "Forget Password ?",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),

                          RichText(
                            text: TextSpan(
                              text: "Don't have account? ",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w800,
                                fontSize: 12.sp,
                              ),
                              children: [
                                TextSpan(
                                  text: ' Sign up',
                                  style: TextStyle(
                                    color: AppColor.primeryColor,
                                    fontSize: 12.sp,
                                  ),

                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => SignUpScreen(),
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
