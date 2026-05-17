import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_maneger/UI/screens/login_screen.dart';
import 'package:task_maneger/UI/screens/update_profile_screen.dart';
import 'package:task_maneger/controller/auth_controller.dart';
import '../../utils/app_color.dart';

class TmAppBar extends StatefulWidget implements PreferredSizeWidget {
  const TmAppBar({super.key});

  @override
  State<TmAppBar> createState() => _TmAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _TmAppBarState extends State<TmAppBar> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      getDataAppbar();
    });
  }

  void getDataAppbar()async{
    await AuthController.getUserData();

  }


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const UpdateProfileScreen()),
        );
      },
      child: AppBar(
        backgroundColor: AppColor.primeryColor,
        actions: [
          IconButton(
            onPressed: () {
              AuthController.cleanUserData();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
            icon: const Icon(Icons.logout),
          )
        ],
        title: Row(
          children: [
            const CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(
                'https://media.licdn.com/dms/image/v2/D4D03AQFvwSL9TeVHVA/profile-displayphoto-scale_200_200/B4DZiiOC4GGgAc-/0/1755068250704?e=2147483647&v=beta&t=CwZzl7bG0j-wFxX0m4C4TpT4enC29-UIIlLFA5zZEuk',
              ),
            ),
            SizedBox(width: 8.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${AuthController.userData?.firstName ?? ''} ${AuthController.userData?.lastName ?? ""}',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Colors.white,
                  ),
                ),
                Text(
                  AuthController.userData?.email ?? '',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
