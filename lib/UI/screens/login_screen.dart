import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_maneger/UI/widgets/screen_background.dart';
import 'package:task_maneger/utils/app_color.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _logInKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _logInKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 150.h),
                Text(
                  'Get Sterted With',
                  style: Theme.of(context).textTheme.titleLarge,
                ),

                SizedBox(height: 15.h),
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
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(hintText: 'Email'),
                ),
                SizedBox(height: 12.h),
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

                FilledButton(
                  onPressed: () {
                    if (_logInKey.currentState!.validate()) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text('Login ')));
                    }
                  },
                  child: Icon(Icons.arrow_circle_right_outlined, size: 25),
                ),

                SizedBox(height: 30.h),
                Center(
                  child: Column(
                    children: [
                      TextButton(
                        onPressed: () {},
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
                          ),
                          children: [
                            TextSpan(
                              text: ' Sign up',
                              style: TextStyle(color: AppColor.primeryColor),

                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  print('clicked');
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
    );
  }
}
