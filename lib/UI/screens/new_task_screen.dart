import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';
import 'package:task_maneger/UI/screens/add_task_screen.dart';
import 'package:task_maneger/UI/widgets/screen_background.dart';
import 'package:task_maneger/data/model/api_response.dart';
import 'package:task_maneger/data/model/task_model.dart';
import 'package:task_maneger/data/model/task_status_count_model.dart';
import 'package:task_maneger/data/service/api_caller.dart';
import 'package:task_maneger/utils/urls.dart';

import '../widgets/task_card.dart';
import '../widgets/task_count_status_card.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});



  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  
  static final Logger _logger = Logger();

  List<TaskStatusCountModel> taskCountByStatus = [];

  Future<void>getAllTaskCount()async{
    final ApiResponse response = await ApiCaller.getRequest(URL: Urls.getTaskCount);

    List<TaskStatusCountModel> taskCount = [];

    if(response.isSuccess){
      for(Map<String,dynamic> jsonData in response.responseData['data']){
        taskCount.add(TaskStatusCountModel.fromJson(jsonData));
      }
    }else {
      // akhne logic ta bujhi nai
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.responseData['data'])));
      _logger.i(response.errorMessage);
    }

    setState(() {
      taskCountByStatus = taskCount;
    });

    _logger.i(response.responseData);
    _logger.i(taskCount.length);
    _logger.i(taskCountByStatus.length);
  }

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllTaskCount();
  }
  /// akhn korechi task count ui te show korano , choto akta error ache hoytw
  /// akhne theke new task ui te show korano


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
                   itemBuilder: (context, index){
                 return TaskCountStatusCard(statusTitle: taskCountByStatus[index].sId.toString(), count: taskCountByStatus[index].sum!.toInt(),);
               },

                   separatorBuilder: (context, index){
                 return SizedBox(width: 7.w,);
                   },


                   itemCount: 4),
             ),
             SizedBox(
               height: 10,
             ),
             Expanded(
               child: ListView.builder(
                   itemCount: 20,
                   itemBuilder: (context , index){
                     return TaskCard(taskModel: TaskModel(id: 04, title: 'Demo Task Title', description: 'Demo task description', date: '02/04/2035', status: 'New'), statusColor: Colors.blue, refreshParent: () {  },);

                   }),
             )

           ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(15),
        child: FloatingActionButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddTaskScreen()));
        }, child: Icon(Icons.add),),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}



