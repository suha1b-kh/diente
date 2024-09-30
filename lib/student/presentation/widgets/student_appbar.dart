import 'package:diente/core/widgets/text.dart';
import 'package:diente/student/presentation/screens/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class StudentAppbar extends StatelessWidget {
  const StudentAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditProfile(),
              ));
        },
        child: SizedBox(
          width: 35.w,
          height: 35.h,
          child: Image.asset(
            'assets/images/profile_photo.png',
          ),
        ),
      ),
      title: Row(
        children: [
          Column(
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
                  color: const Color(0xFF1B2A57),
                  fontSize: 12.sp,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 0.h,
                ),
              )
            ],
          ),
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
