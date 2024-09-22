import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StudentAppbar extends StatelessWidget {
  const StudentAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: CircleAvatar(
        radius: 20.r,
        child: Image.asset(
          'assets/images/profile_photo.png',
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome Back,',
            style: TextStyle(
              color: const Color(0xFFADA4A5),
              fontSize: 15.sp,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w300,
              height: 0.h,
            ),
          ),
          Text(
            'Diente student',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 12.sp,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              height: 0.h,
            ),
          )
        ],
      ),
      actions: const [
        Icon(
          Icons.notifications_none_outlined,
          size: 35,
        )
      ],
    );
  }
}
