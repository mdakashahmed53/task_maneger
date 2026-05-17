import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_maneger/UI/screens/main_nav_screen.dart';
import 'package:task_maneger/UI/widgets/screen_background.dart';
import 'package:task_maneger/UI/widgets/tm_appbar.dart';
import 'package:task_maneger/controller/auth_controller.dart';
import 'package:task_maneger/data/model/api_response.dart';
import 'package:task_maneger/data/model/user_model.dart';
import 'package:task_maneger/data/service/api_caller.dart';
import 'package:task_maneger/utils/urls.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    UserModel user = AuthController.userData!;

    firstnameController.text = user.firstName!;
    lastNameController.text = user.lastName!;
    phoneController.text = user.mobile!;
    emailController.text = user.email!;

  }

  TextEditingController emailController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  void _showButtomModelSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.camera_alt_outlined, size: 80),
                      ),
                      Text('Camera', style: TextStyle(fontSize: 20)),
                    ],
                  ),

                  Column(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.photo, size: 80),
                      ),
                      Text('Album', style: TextStyle(fontSize: 20)),
                    ],
                  ),

                  // Image.asset('assets/images/camera.png', width: 80, height: 80,),
                  // SizedBox(
                  //   width: 10.w,
                  // ),
                  // Image.asset('assets/images/galary.png', height: 80, width: 80,)
                  //
                  SizedBox(height: 40),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void>updateProfile()async{
    Map<String, dynamic>requestBody = {
      "email":emailController.text.trim(),
      "firstName":firstnameController.text,
      "lastName":lastNameController.text,
      "mobile":phoneController.text.trim(),
    };

    if(newPasswordController.text.isNotEmpty){
      requestBody['password']  = newPasswordController.text.trim();
    }

    final ApiResponse response = await ApiCaller.postRequest(URL: Urls.updateProfile, body: requestBody);

    if(response.isSuccess){
      UserModel userModel = UserModel(
        sId: AuthController.userData?.sId,
        email: emailController.text.trim(),
        firstName: firstnameController.text,
        lastName: lastNameController.text,
        mobile: phoneController.text.trim(),
      );

      AuthController.updateUserData(userModel);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainNavScreen()));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Profile Updated')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Profile Update Failed')));
      print(response.responseData['data']);
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: TmAppBar(),
      body: SafeArea(
        child: ScreenBackground(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(height: 30.h),

                // from
                Padding(
                  padding: const EdgeInsets.all(35),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Update Profile',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),

                      SizedBox(height: 15.h),


                      InkWell(
                        onTap: (){
                          _showButtomModelSheet();
                        },
                        child: Container(
                          height: 42.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)
                          ),
                          child: Row(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: 42.h,
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(color: Colors.blueGrey,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  topLeft: Radius.circular(10)
                                )
                                ),
                                child: Text(
                                  'Photos',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 7.w,
                              ),

                              Expanded(child: Text('Update Image'))
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 10.h),

                      // person name
                      TextFormField(
                        controller: firstnameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'name is required';
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(hintText: 'First Name'),
                      ),
                      SizedBox(height: 10.h),
                      TextFormField(
                        controller: lastNameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'name is required';
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(hintText: 'Last Name'),
                      ),
                      SizedBox(height: 10.h),
                      // phone number
                      TextFormField(
                        controller: phoneController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'phone number is required';
                          } else if (!value.contains('01')) {
                            return 'must be valid phone';
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(hintText: 'Mobile'),
                      ),
                      SizedBox(height: 10.h),
                      // email address
                      TextFormField(
                        controller: emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'email is required';
                          } else if (!value.contains('@')) {
                            return 'must be valid email';
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(hintText: 'Email'),
                      ),
                      SizedBox(height: 10.h),

                      // new password
                      TextFormField(
                        controller: newPasswordController,
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(hintText: 'Password'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password is required';
                          } else if (value.length < 8) {
                            return 'Password must be at least 8 characters';
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 10.h),



                      SizedBox(height: 12.h),

                      // submit button filledbutton
                      FilledButton(
                        onPressed: () {
                          updateProfile();
                        },

                        child: Icon(
                          Icons.arrow_circle_right_outlined,
                          size: 25,
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
    );
  }
}
