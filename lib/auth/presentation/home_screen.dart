import 'package:diente/core/widgets/buttons.dart';
import 'package:diente/core/widgets/text.dart';
import 'package:diente/student/login/student_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          //logo
          Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Gap(90.h),
            //logo
            SizedBox(
              width: 279.72.w,
              height: 126.35.h,
              child: Image.asset(
                'assets/images/logo.png',
              ),
            ),
            Gap(230.h),
            //login button
            customButtonWithBorder(
                context, Theme.of(context).colorScheme.secondary, () {
              Navigator.popAndPushNamed(context, '/login_screen');
            },
                customText(
                  context,
                  'Patient Login',
                  Theme.of(context).colorScheme.secondary,
                  16.sp,
                  FontWeight.w500,
                )),
            Gap(15.h),
            //signup button
            customButton(context, Theme.of(context).colorScheme.secondary, () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const StudentLoginScreen();
              }));
            }, 'Student Login', 16.sp),
          ],
        ),
      ),
    );
  }
}
