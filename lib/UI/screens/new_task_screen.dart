
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:logger/logger.dart';
import 'package:task_maneger/data/model/api_response.dart';
import 'package:task_maneger/data/model/task_model.dart';
import 'package:task_maneger/data/model/task_status_count_model.dart';
import 'package:task_maneger/data/service/api_caller.dart';
import 'package:task_maneger/utils/urls.dart';

import '../../provider_state/get_new_task_provider.dart';
import '../widgets/screen_background.dart';
import '../widgets/task_card.dart';
import '../widgets/task_count_status_card.dart';
import 'add_task_screen.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllTaskCount();
    getAllNewTask();

  }

  static final Logger _logger = Logger();

  List<TaskStatusCountModel> taskCountByStatus = [];
  List<TaskModel> newTasks = [];


  Future<void> getAllTaskCount() async {
    final ApiResponse response = await ApiCaller.getRequest(
      URL: Urls.getTaskCount,
    );

    List<TaskStatusCountModel> taskCount = [];

    if (response.isSuccess) {
      for (Map<String, dynamic> jsonData in response.responseData['data']) {
        taskCount.add(TaskStatusCountModel.fromJson(jsonData));
      }
    } else {
      // akhne logic ta bujhi nai
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(response.responseData['data'])));
      _logger.i(response.errorMessage);
    }

    setState(() {
      taskCountByStatus = taskCount;
    });

    _logger.i(response.responseData);
    _logger.i(taskCount.length);
    _logger.i(taskCountByStatus.length);
  }

  // Future<void> getAllNewTask() async {
  //   final ApiResponse response = await ApiCaller.getRequest(
  //     URL: Urls.taskByStatus('New'),
  //   );
  //
  //   List<TaskModel> task = [];
  //
  //   if (response.isSuccess) {
  //     for (Map<String, dynamic> jsonTask in response.responseData['data']) {
  //       task.add(TaskModel.fromJson(jsonTask));
  //     }
  //   } else {
  //     ScaffoldMessenger.of(
  //       context,
  //     ).showSnackBar(SnackBar(content: Text('Task Empty')));
  //   }
  //
  //   setState(() {
  //     newTasks = task;
  //   });
  //
  //   _logger.i(newTasks.length);
  //   _logger.i(task.length);
  //   _logger.i(response.responseData);
  // }

  Future<void> getAllNewTask() async {
    final getNewTaskProvider = context.read<GetNewTaskProvider>();

    bool isSuccess = await getNewTaskProvider.getAllNewTask();

    if (isSuccess) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Task Screen')));
    }else{
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Task Empty')));
    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 60.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return TaskCountStatusCard(
                      statusTitle: taskCountByStatus[index].sId.toString(),
                      count: taskCountByStatus[index].sum!.toInt(),
                    );
                  },

                  separatorBuilder: (context, index) {
                    return SizedBox(width: 7.w);
                  },

                  itemCount: taskCountByStatus.length,
                ),
              ),
              SizedBox(height: 10),

              Expanded(
                child: Consumer<GetNewTaskProvider>(
                  builder: (context, provider, _) {
                    return ListView.builder(
                      itemCount: provider.allTasks.length,

                      itemBuilder: (context, index) {

                        return TaskCard(
                          taskModel: provider.allTasks[index],
                          statusColor: Colors.blue,
                          refreshParent: () {
                            getAllNewTask();
                            getAllTaskCount();
                          },
                        );
                      },
                    );
                  }
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(15),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddTaskScreen()),
            );
          },
          child: Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
