import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_maneger/UI/widgets/screen_background.dart';
import 'package:task_maneger/utils/app_color.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleConroller = TextEditingController();
    TextEditingController bodyController = TextEditingController();

    return Scaffold(
      // appBar: AppBar(
      // leading: CircleAvatar(
      //   radius: 40,
      //   backgroundImage: NetworkImage('https://media.licdn.com/dms/image/v2/D4D03AQFvwSL9TeVHVA/profile-displayphoto-scale_200_200/B4DZiiOC4GGgAc-/0/1755068250704?e=2147483647&v=beta&t=CwZzl7bG0j-wFxX0m4C4TpT4enC29-UIIlLFA5zZEuk'),
      // ),
      // ),
      body: SafeArea(
        child: ScreenBackground(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 65.h,
                width: double.maxFinite,
                decoration: BoxDecoration(color: AppColor.primeryColor),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(
                        'https://media.licdn.com/dms/image/v2/D4D03AQFvwSL9TeVHVA/profile-displayphoto-scale_200_200/B4DZiiOC4GGgAc-/0/1755068250704?e=2147483647&v=beta&t=CwZzl7bG0j-wFxX0m4C4TpT4enC29-UIIlLFA5zZEuk',
                        width: 40.w,
                        height: 50.h,
                        fit: BoxFit.cover,
                      ),
                    ),

                    title: Text('Md. Akash Ahmed'),
                    subtitle: Text('akash@gmail.com'),
                  ),
                ),
              ),

              SizedBox(height: 80.h),

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
                      controller: titleConroller,
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
