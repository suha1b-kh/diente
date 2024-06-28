import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../widgets/list_reports.dart';


// ignore: camel_case_types
class mainProfile extends StatelessWidget {
  const mainProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                margin:  EdgeInsets.only(top: 100.h, bottom: 10.h),
                width: 145.w,
                height: 145.h,
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(500.0.r)),
                  image: const DecorationImage(
                    //Todo fetch student image from firebase
                    image: AssetImage('assets/images/profile.png'),

                  ),
                ),
              ),
            ),
             Text(
              'Diente student',
              style: TextStyle(
                color: const Color(0xFF1B2A57),
                fontSize: 20.sp,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 0.h,
              ),
            ),
            const Gap(57),
             Text(
              'Diente student  Reports',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFF1B2A57),
                fontSize: 20.sp,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
             Gap(28.h),
           const listReportsView()
            
          ],
        ),
      ),
    );
  }
}
