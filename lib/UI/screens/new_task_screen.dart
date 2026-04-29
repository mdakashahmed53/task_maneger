import 'package:flutter/material.dart';
import 'package:task_maneger/UI/widgets/screen_background.dart';
import 'package:task_maneger/UI/widgets/tm_appbar.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TmAppBar(),
      body: ScreenBackground(child: Row(children: [
        Container(
          child: Column(children: [
            Text('09')
          ],),
        )
      ],)),
    );
  }
}