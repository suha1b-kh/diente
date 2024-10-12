import 'package:diente/student/data/models/student.dart';
import 'package:diente/student/login/services/student_login_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class StudentAppbar extends StatelessWidget {
  const StudentAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          GestureDetector(
            onTap: () =>
                Navigator.of(context).pushNamed('/main_student_profile'),
            child: const CircleAvatar(
                // backgroundImage: NetworkImage(student.profilePic),
                ),
          ),
          Gap(15.w),
          Column(
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
                'student.name', //TODO: get student name
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 12.sp,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 0.h,
                ),
              ),
            ],
          ),
          Gap(140.w),
          const Icon(
            Icons.notifications_none_outlined,
            size: 35,
          ),
        ],
      ),
    );
  }
}
