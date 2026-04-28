import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_maneger/UI/widgets/screen_background.dart';
import 'package:task_maneger/utils/app_color.dart';

import 'login_screen.dart';

// class name change korte hbe
class SetPasswordScreen extends StatelessWidget {
  const SetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    TextEditingController newPassController = TextEditingController();
    TextEditingController confirmPassController = TextEditingController();


    return Scaffold(
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(40),
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
                'Minimum length password 8 character with Latter and number combination',
                style: TextStyle(
                  fontSize: 15.sp,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 12.h),
              // email address

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
                controller: newPassController,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(hintText: 'New Password'),
              ),

              SizedBox(height: 12.h),
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


           



              SizedBox(height: 13.h),

              // filled button
              FilledButton(
                onPressed: () {},

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
                          fontSize: 12.sp
                        ),
                        children: [
                          TextSpan(
                            text: 'Sign in',
                            style: TextStyle(color: AppColor.primeryColor,
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
    );
  }
}
