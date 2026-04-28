import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_maneger/UI/screens/login_screen.dart';
import 'package:task_maneger/UI/widgets/screen_background.dart';
import 'package:task_maneger/utils/app_color.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController newPasswordController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController newPassController = TextEditingController();
    TextEditingController confirmPassController = TextEditingController();

    final _singUpkey = GlobalKey<FormState>();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: ScreenBackground(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _singUpkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 80.h),
                    Text(
                      'Join With Us',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),

                    SizedBox(height: 15.h),
                    // person name
                    TextFormField(
                      controller: nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'name is required';
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(hintText: 'Name'),
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
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(hintText: 'Mobile'),
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
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(hintText: 'Email'),
                    ),
                    SizedBox(height: 10.h),
                    // new password
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'password is required';
                        } else if (value.length < 8) {
                          return 'password must be 8 charector';
                        } else {
                          return null;
                        }
                      },
                      controller: newPasswordController,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(hintText: 'New Password'),
                    ),

                    SizedBox(height: 10.h),
                    // confirm password
                    // password don't match code problem
                    //
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'password is required';
                        } else if (value != newPassController.text) {
                          // return 'password must be 8 charector';
                          return "Don't match";
                        } else if (value.length < 8) {
                          // return "Don't match";
                          return 'password must be 8 charector';
                        } else {
                          return null;
                        }
                      },
                      controller: confirmPassController,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(hintText: 'Confirm Password'),
                    ),

                    SizedBox(height: 12.h),

                    FilledButton(
                      onPressed: () {
                        if (_singUpkey.currentState!.validate()) {
                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(SnackBar(content: Text('Sign Up ')));
                        }
                      },

                      child: Icon(Icons.arrow_circle_right_outlined, size: 25),
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
