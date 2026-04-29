import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_maneger/UI/widgets/screen_background.dart';
import 'package:task_maneger/utils/app_color.dart';

import '../widgets/tm_appbar.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController bodyController = TextEditingController();

    return Scaffold(
      appBar: TmAppBar(),
      body: SafeArea(
        child: ScreenBackground(
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
                      onPressed: () {},
                      child: Icon(Icons.arrow_circle_right_outlined, size: 25),
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



