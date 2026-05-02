import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskCountStatusCard extends StatelessWidget {
  final String statusTitle;
  final int count;
  const TaskCountStatusCard({
    super.key, required this.statusTitle, required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
     width: 80.w,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                offset: Offset(1, 3),
                color: Colors.white
            )
          ],
          borderRadius: BorderRadius.circular(10)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(count.toString(),style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 18.sp
            ),),
            Text(statusTitle, style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontSize: 11.sp
            ),)
          ],
        ),
      ),
    );
  }
}