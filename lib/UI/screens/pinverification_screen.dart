import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_maneger/UI/screens/setpassword_screen.dart';
import 'package:task_maneger/UI/widgets/screen_background.dart';
import 'package:task_maneger/data/model/api_response.dart';
import 'package:task_maneger/data/service/api_caller.dart';
import 'package:task_maneger/utils/app_color.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_maneger/utils/urls.dart';

import 'login_screen.dart';

class PinVerificationScreen extends StatefulWidget {
  const PinVerificationScreen({required this.email, super.key});

  final String email;

  @override
  State<PinVerificationScreen> createState() => _PinVerificationScreenState();
}

class _PinVerificationScreenState extends State<PinVerificationScreen> {
  PinInputController otpController = PinInputController();
  Future<void> otpSubmit() async {
    final String oldEmail = widget.email;

    ApiResponse response = await ApiCaller.getRequest(
      URL: Urls.recoveryOtpVery(oldEmail, otpController.text),
    );

    if (response.isSuccess) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SetPasswordScreen(email: oldEmail, otp: otpController.text,)),
      );
      print(response.responseData['data']);
      otpController.clear();
    } else {
      otpController.clear();
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(response.responseData['data'])));
      print(response.responseData['data']);
    }
  }

  Future<void>reSentOtp()async{
    ApiResponse response = await ApiCaller.getRequest(URL: Urls.recoveryEmailVerify(widget.email));

    if(response.isSuccess){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('OTP Sent Successful')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.responseData['data'])));
      print(response.responseData['data']);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TextEditingController OTPController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: ScreenBackground(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 100.h),
                  Text(
                    'PIN Verification',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    'A 6 digit verification pin will sent to your email address',
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 10.h),

                  // ✅ Fixed PIN field (removed small width constraint)
                  Center(
                    child: SizedBox(
                      width: double.infinity,
                      child: MaterialPinField(
                        length: 6,
                        pinController: otpController,
                        enableAutofill: true,
                        onChanged: (value){
                          setState(() {

                          });
                        },
                        enabled: true,
                        theme: MaterialPinTheme(

                          showCursor: true,
                          completeFillColor: Colors.white,
                          shape: MaterialPinShape.filled,
                          borderColor: Colors.white,
                          fillColor: Colors.white,
                          filledBorderColor: Colors.white,
                          focusedFillColor: Colors.white,
                          borderWidth: 1, 
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 12.h),

                  FilledButton(
                    onPressed: () {
                      otpSubmit();
                    },
                    child: Text('Verify'),
                  ),
                  
                  SizedBox(
                      width: double.infinity,
                      child: TextButton(onPressed: (){
                        reSentOtp();
                      }, child: Text('Resent OTP', style: TextStyle(
                        fontWeight: FontWeight.w700
                      ),))),

                  SizedBox(height: 30.h),
                  Center(
                    child: Column(
                      children: [
                        RichText(
                          text: TextSpan(
                            text: "Have account? ",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w800,
                              fontSize: 12.sp,
                            ),
                            children: [
                              TextSpan(
                                text: 'Sign in',
                                style: TextStyle(
                                  color: AppColor.primeryColor,
                                  fontSize: 12.sp,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LoginScreen(),
                                      ),
                                    );
                                  },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    otpController.dispose();
  }
}
