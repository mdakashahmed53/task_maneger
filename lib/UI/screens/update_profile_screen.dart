import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_maneger/UI/widgets/screen_background.dart';
import 'package:task_maneger/UI/widgets/tm_appbar.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController newPasswordController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController confirmPassController = TextEditingController();

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

                      // image picker working....
                      // Align(
                      //   alignment: Alignment.center,
                      //   child: InkWell(
                      //     hoverColor: Colors.grey,
                      //     focusColor: Colors.green,
                      //     onTap: (){

                      //     },
                      //     child: ClipRRect(
                      //       borderRadius: BorderRadius.circular(100),
                      //       child: Image.network(
                      //         'https://media.licdn.com/dms/image/v2/D4D03AQFvwSL9TeVHVA/profile-displayphoto-scale_200_200/B4DZiiOC4GGgAc-/0/1755068250704?e=2147483647&v=beta&t=CwZzl7bG0j-wFxX0m4C4TpT4enC29-UIIlLFA5zZEuk',
                      //         width: 80.w,
                      //         height: 70.h,
                      //         fit: BoxFit.cover,
                      //       ),
                      //     ),
                      //   ),
                      // ),
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
                        controller: nameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'name is required';
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(hintText: 'Name'),
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
                        decoration: InputDecoration(hintText: 'New Password'),
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

                      // confirm password
                      TextFormField(
                        controller: confirmPassController,
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          hintText: 'Confirm Password',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password is required';
                          } else if (value.length < 8) {
                            return 'Password must be at least 8 characters';
                          } else if (value != newPasswordController.text) {
                            // ✅ FIXED HERE
                            return "Passwords don't match";
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 12.h),

                      // submit button filledbutton
                      FilledButton(
                        onPressed: () {},

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
