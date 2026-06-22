import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:task_maneger/UI/screens/main_nav_screen.dart';
import 'package:task_maneger/UI/screens/new_task_screen.dart';
import 'package:task_maneger/UI/widgets/screen_background.dart';
import 'package:http/http.dart' as http;
import 'package:task_maneger/data/model/api_response.dart';
import 'package:task_maneger/data/service/api_caller.dart';
import 'package:task_maneger/provider_state/add_task_provider.dart';
import 'package:task_maneger/utils/urls.dart';

import '../widgets/tm_appbar.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  final AddTaskProvider addTaskProvider = AddTaskProvider();

  // Future<void> addTask() async {
  //   Map<String, dynamic> bodyRequest = {
  //     "title": titleController.text,
  //     "description": bodyController.text,
  //     "status": "New",
  //   };
  //
  //   final ApiResponse response = await ApiCaller.postRequest(
  //     URL: Urls.createTask,
  //     body: bodyRequest,
  //   );
  //
  //   if (response.isSuccess) {
  //     ScaffoldMessenger.of(
  //       context,
  //     ).showSnackBar(SnackBar(content: Text('Task Added')));
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(builder: (context) => MainNavScreen()),
  //     );
  //   } else {
  //     ScaffoldMessenger.of(
  //       context,
  //     ).showSnackBar(SnackBar(content: Text('Task Added Failed')));
  //   }
  // }

  Future<void> addTask() async {
    bool isSuccess = await addTaskProvider.addTask(
      titleController.text.trim(),
      bodyController.text.trim(),
    );

    if (isSuccess) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Task Added')));
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Task Added Failed')));
    }
  }

  //alert dialog
  void _showAddTaskAlert() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset('assets/anim/done.json', height: 200),
              Text('Task Added', style: GoogleFonts.lobster(fontSize: 30)),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TmAppBar(),
      body: SafeArea(
        child: ScreenBackground(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50.h),

                Padding(
                  padding: const EdgeInsets.all(35),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Add New Task',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),

                      SizedBox(height: 15.h),
                      // title text field
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'title is required';
                          } else {
                            return null;
                          }
                        },
                        controller: titleController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(hintText: 'Subject'),
                      ),
                      SizedBox(height: 12.h),
                      // description field
                      TextFormField(
                        textAlign: TextAlign.start,
                        controller: bodyController,
                        maxLines: 8,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(hintText: 'Description'),
                      ),

                      SizedBox(height: 12.h),
                      // sign in button
                      FilledButton(
                        onPressed: () {
                          addTask();
                        },
                        child: Icon(
                          Icons.arrow_circle_right_outlined,
                          size: 25,
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
