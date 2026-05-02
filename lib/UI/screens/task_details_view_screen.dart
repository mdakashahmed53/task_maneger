import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_maneger/UI/screens/add_task_screen.dart';
import 'package:task_maneger/UI/widgets/screen_background.dart';

class TaskDetailsViewScreen extends StatelessWidget {

  final String taskTitle, description, createDate;
  const TaskDetailsViewScreen({super.key, required this.taskTitle, required this.description, required this.createDate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ScreenBackground(child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(taskTitle, style: GoogleFonts.lobster(
                  fontSize: 30
                ),),
                Text('Date: $createDate', style: GoogleFonts.robotoSlab(
                  fontSize: 15
                ),),
                Divider(thickness: 1,
                color: Colors.black,
                ),
          
                Text(description, style: GoogleFonts.robotoSlab(
                    fontSize: 30
                ),),
          
              ],
            ),
          ),
        )),
      ),
      floatingActionButton: Padding(
          padding: EdgeInsets.all(15),
          child: FloatingActionButton(

            onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AddTaskScreen()));
          }, child: Icon(Icons.add),)),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked
    );
  }
}
