import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_maneger/UI/screens/task_details_view_screen.dart';
import 'package:task_maneger/data/model/api_response.dart';
import 'package:task_maneger/data/model/task_model.dart';
import 'package:task_maneger/data/service/api_caller.dart';
import 'package:task_maneger/provider_state/delete_task_provider.dart';
import 'package:task_maneger/utils/urls.dart';

class TaskCard extends StatefulWidget {
  final TaskModel taskModel;
  final Color statusColor;
  final VoidCallback refreshParent;
  const TaskCard({
    super.key,
    required this.taskModel,
    required this.statusColor,
    required this.refreshParent,
  });

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  final DeleteTaskProvider deleteTaskProvider = DeleteTaskProvider();

  // Future<void> deleteTask() async {
  //   final ApiResponse response = await ApiCaller.getRequest(
  //     URL: Urls.taskDelete(widget.taskModel.id),
  //   );

  //   setState(() {});

  //   if (response.isSuccess) {
  //     widget.refreshParent();
  //     ScaffoldMessenger.of(
  //       context,
  //     ).showSnackBar(SnackBar(content: Text('Task Deleted')));
  //   } else {
  //     ScaffoldMessenger.of(
  //       context,
  //     ).showSnackBar(SnackBar(content: Text('Task Delete Failed')));
  //   }
  //   print(response.responseData);
  // }

  Future<void> deleteTask() async {
    bool isSuccess = await deleteTaskProvider.deleteTask(widget.taskModel.id);


    if(isSuccess){
       widget.refreshParent();
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Task Deleted')));
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Task Delete Failed')));
    }
  }

  Future<void> changeStatus(String status) async {
    final ApiResponse response = await ApiCaller.getRequest(
      URL: Urls.updateTaskStatus(widget.taskModel.id, status),
    );

    setState(() {});

    if (response.isSuccess) {
      Navigator.pop(context);

      widget.refreshParent();
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Task Status Change')));
    } else {
      Navigator.pop(context);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Task Status Change Failed')));
    }
  }

  void _showChangeStatusDialoge() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Change Status'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Card(
                color: widget.taskModel.status == 'New' ? Colors.green : null,
                child: ListTile(
                  title: Text(
                    'New Task',
                    style: TextStyle(color: Colors.black),
                  ),
                  onTap: () {
                    changeStatus('New');
                  },

                  trailing: Icon(
                    Icons.check_circle_outline,
                    color: widget.taskModel.status == "New"
                        ? Colors.white
                        : null,
                  ),
                ),
              ),
              Card(
                color: widget.taskModel.status == 'Progress'
                    ? Colors.green
                    : null,
                child: ListTile(
                  title: Text(
                    'Progress Task',
                    style: TextStyle(color: Colors.black),
                  ),
                  onTap: () {
                    changeStatus('Progress');
                  },
                  trailing: Icon(
                    Icons.check_circle_outline,
                    color: widget.taskModel.status == "Progress"
                        ? Colors.white
                        : null,
                  ),
                ),
              ),
              Card(
                color: widget.taskModel.status == 'Complete'
                    ? Colors.green
                    : null,
                child: ListTile(
                  title: Text(
                    'Complete Task',
                    style: TextStyle(color: Colors.black),
                  ),
                  onTap: () {
                    changeStatus('Complete');
                  },
                  trailing: Icon(
                    Icons.check_circle_outline,
                    color: widget.taskModel.status == "Complete"
                        ? Colors.white
                        : null,
                  ),
                ),
              ),

              Card(
                color: widget.taskModel.status == 'Cancel'
                    ? Colors.green
                    : null,
                child: ListTile(
                  title: Text(
                    'Cancel Task',
                    style: TextStyle(color: Colors.black),
                  ),
                  onTap: () {
                    changeStatus('Cancel');
                  },
                  trailing: Icon(
                    Icons.check_circle_outline,
                    color: widget.taskModel.status == "Cancel"
                        ? Colors.white
                        : null,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TaskDetailsViewScreen(
              taskTitle: widget.taskModel.title,
              description: widget.taskModel.description,
              createDate: widget.taskModel.createdDate,
            ),
          ),
        );
      },
      child: Card(
        color: Colors.white,
        child: ListTile(
          title: Text(
            widget.taskModel.title,
            style: Theme.of(
              context,
            ).textTheme.titleLarge!.copyWith(fontSize: 12.sp),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.taskModel.description,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.black54,
                  fontSize: 10.sp,
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                'Date: ${widget.taskModel.createdDate}',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 10.sp,
                ),
              ),
              SizedBox(height: 5.h),
              Row(
                children: [
                  Chip(
                    labelPadding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 10,
                    ),
                    label: Text(
                      widget.taskModel.status,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    backgroundColor: widget.statusColor,
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      _showChangeStatusDialoge();
                    },
                    icon: Icon(
                      Icons.edit_note_outlined,
                      size: 30,
                      color: Colors.green,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      deleteTask();
                    },
                    icon: Icon(Icons.delete, color: Colors.red, size: 30),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
