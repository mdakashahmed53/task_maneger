import 'package:flutter/material.dart';
import 'package:task_maneger/UI/Screens/splash_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_maneger/UI/screens/forget_screen.dart';
import 'package:task_maneger/UI/screens/pinverification_screen.dart';
import 'package:task_maneger/UI/screens/signup_screen.dart';
import 'package:task_maneger/utils/app_color.dart';


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
          home: PinVerificationScreen(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            textTheme: TextTheme(
              titleLarge: TextStyle(
                fontSize: 26.sp,
                fontWeight: FontWeight.w600
              )
            ),

            inputDecorationTheme: InputDecorationTheme(
              filled: true,
              hoverColor: Colors.white,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderSide: BorderSide.none
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none
              ),
              
            ),

            filledButtonTheme: FilledButtonThemeData(
              style: FilledButton.styleFrom(
                backgroundColor: AppColor.primeryColor,
                fixedSize: Size.fromWidth(double.maxFinite),
                padding: EdgeInsets.symmetric(vertical: 10.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)
                ),
                textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                )
              )
            )

          ),
        );
      },
    );
  }
}



