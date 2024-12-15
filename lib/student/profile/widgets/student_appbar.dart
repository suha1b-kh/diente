import 'package:diente/student/data/models/student.dart';
import 'package:diente/student/login/services/student_login_services.dart';
import 'package:diente/student/profile/screens/main_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class StudentAppbar extends StatelessWidget {
  const StudentAppbar({
    super.key,
    required this.student,
  });
  final StudentModel student;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MainStudentProfile(
                  stdModel: student,
                  )),
            ),
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: Text(
                student.name.substring(0, 2).toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
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
              SizedBox(
                width: 230.w,
                child: Text(
                  student.name,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 12.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0.h,
                  ),
                ),
              ),
            ],
          ),
          // const Icon(
          //   Icons.notifications_none_outlined,
          //   size: 35,
          // ),
        ],
      ),
    );
  }
}