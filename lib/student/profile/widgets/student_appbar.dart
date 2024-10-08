import 'package:diente/student/data/models/student.dart';
import 'package:diente/student/login/services/student_login_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StudentAppbar extends StatelessWidget {
  const StudentAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: StudentAuthFirebaseServices().fetchUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('');
        } else if (snapshot.hasError) {
          return AppBar(
            title: Text('Error: ${snapshot.error}'),
          );
        } else if (!snapshot.hasData) {
          return AppBar(
            title: const Text('User not found'),
          );
        } else {
          StudentModel student = snapshot.data!;
          return AppBar(
            leading: MaterialButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed('/main_student_profile'),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/stu_img.png',
                  width: 145.w,
                  height: 145.h,
                  fit: BoxFit.cover,
                ),
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
                  student.name,
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
            actions: const [
              Icon(
                Icons.notifications_none_outlined,
                size: 35,
              ),
            ],
          );
        }
      },
    );
  }
}
