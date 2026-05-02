import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_maneger/UI/screens/login_screen.dart';
import 'package:task_maneger/UI/widgets/screen_background.dart';
import 'package:task_maneger/utils/asset_path.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void>NextPageMove()async{
    await Future.delayed(Duration(seconds: 5));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    NextPageMove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset('assets/anim/task.json', height: 240),
            Text('Task Maneger', style: GoogleFonts.lobster(fontSize: 30),)
          ],
        ),

      ),),
    );
  }
}


