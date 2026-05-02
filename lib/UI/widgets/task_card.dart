import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_maneger/UI/screens/task_details_view_screen.dart';
import 'package:task_maneger/data/task_model.dart';

class TaskCard extends StatelessWidget {
  final TaskModel taskModel;
  final Color statusColor;
  final VoidCallback refreshParent;
  const TaskCard({
    super.key, required this.taskModel, required this.statusColor, required this.refreshParent,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>TaskDetailsViewScreen(taskTitle: taskModel.title, description: taskModel.description, createDate: taskModel.date)));
      },
      child: Card(
        color: Colors.white,
        child: ListTile(

          title: Text(taskModel.title,style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontSize: 12.sp
          ),),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(taskModel.description, style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.black54,
                  fontSize: 10.sp
              ),),
              SizedBox(
                height: 5.h,
              ),
              Text('Date: ${taskModel.date}', style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                fontSize: 10.sp
              ),),
              SizedBox(
                height: 5.h,
              ),
              Row(children: [
                Chip(
                  labelPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  label: Text(taskModel.status, style: TextStyle(
                  color: Colors.white,
                  fontSize: 10.sp,
                    fontWeight: FontWeight.w700
                ),), backgroundColor: statusColor,),
                Spacer(),
                IconButton(onPressed: (){}, icon: Icon(Icons.edit_note_outlined, size: 30, color: Colors.green,)),
                IconButton(onPressed: (){}, icon: Icon(Icons.delete, color: Colors.red, size: 30,)),

              ],)
            ],
          ),
        ),
      ),
    );
  }
}