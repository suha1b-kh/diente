import 'package:diente/core/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

Widget google(BuildContext context) {
  return Column(children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 90.w,
          height: 1,
          color: Theme.of(context).colorScheme.secondary,
        ),
        customText(context, '  Or continue with  ',
            Theme.of(context).colorScheme.primary, 14.sp, FontWeight.normal),
        Container(
          width: 90.w,
          height: 1,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ],
    ),
    Gap(24.h),
    Center(
      child: Container(
        width: 77.w,
        height: 52.h,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0xFFD9D9D9)),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Center(
            child: Image.asset(
                width: 50.w, height: 50.h, 'assets/images/google.png')),
      ),
    ),
  ]);
}
