import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ActiveWidget extends StatelessWidget {
  ActiveWidget({super.key, required this.patientName, required this.CaseName});
  String patientName;
  String CaseName ;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 18),
          child: Container(
            width: 335.w,
            height: 120.h,
            decoration: ShapeDecoration(
              color: const Color(0xFFF2F4F7),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Row(
              children: [
                Gap(14.w),
                CircleAvatar(
                  radius: 28.r,
                  child: Image.asset(
                    'assets/images/profile_photo.png',
                  ),
                ),
                Gap(20.w),
                Text(
                  patientName,
                  style: TextStyle(
                    color: const Color(0xFF1B2A57),
                    fontSize: 16.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0.h,
                  ),
                ),
                Gap(10.w),
                    Text(
                  CaseName,
                  style: TextStyle(
                    color: const Color(0xFF1B2A57),
                    fontSize: 16.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0.h,
                  ),
                ),
                Gap(140.w),
                const Icon(Icons.arrow_forward_ios),
              ],
            ),
          ),
        )
      ],
    );
  }
}
