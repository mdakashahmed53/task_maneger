import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_maneger/UI/widgets/screen_background.dart';
import 'package:task_maneger/utils/app_color.dart';

import 'login_screen.dart';

class ForgetScreen extends StatelessWidget {
  const ForgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();

    return Scaffold(
      body: ScreenBackground(child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 100.h,
            ),
            Text('Your Email Address',style: Theme.of(context).textTheme.titleLarge,),
            SizedBox(height: 10.h,),
            Text('A 6 digit verification pin will sent to your email address',style: TextStyle(
              fontSize: 15.sp,
              color: Colors.grey,
              fontWeight: FontWeight.w500
            ),),
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
            SizedBox(height: 12.h),

            FilledButton(
              onPressed: () {

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
                      ),
                      children: [
                        TextSpan(
                          text: 'Sign in',
                          style: TextStyle(color: AppColor.primeryColor),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
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
      )),
    );
  }
}
