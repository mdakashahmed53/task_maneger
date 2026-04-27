import 'package:flutter/material.dart';
import 'package:task_maneger/UI/Screens/splash_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class TaskManegerApp extends StatelessWidget {
  const TaskManegerApp({super.key});

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_ , child) {

        return MaterialApp(
          title: 'Task Maneger App',

          home: SplashScreen(),
          debugShowCheckedModeBanner: false,
        );


      },

    );




  }
}



