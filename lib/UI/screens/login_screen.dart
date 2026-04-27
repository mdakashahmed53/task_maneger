import 'package:flutter/material.dart';
import 'package:task_maneger/UI/widget/screen_background.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        
          Text('Get Sterted With'),
          TextFormField(),
          TextFormField(),
        ],
      )),
    );
  }
}
