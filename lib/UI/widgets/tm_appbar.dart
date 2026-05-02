import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_color.dart';

class TmAppBar extends StatelessWidget implements PreferredSize{
  const TmAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.primeryColor,
      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.logout))
      ],
      title: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage('https://media.licdn.com/dms/image/v2/D4D03AQFvwSL9TeVHVA/profile-displayphoto-scale_200_200/B4DZiiOC4GGgAc-/0/1755068250704?e=2147483647&v=beta&t=CwZzl7bG0j-wFxX0m4C4TpT4enC29-UIIlLFA5zZEuk'),
          ),
          SizedBox(
            width: 8.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Md. Akash Ahmed', style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Colors.white
              )),
              Text('akash@gmail.com', style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Colors.white
              )),
            ],
          )
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();
}