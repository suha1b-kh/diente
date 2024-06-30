import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_button.dart';

class CustomCard extends StatelessWidget {
  String title = "";
  String description = "";
  VoidCallback onTap;

  CustomCard(
      {required this.title, required this.description, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 17.w, vertical: 15.h),
        width: 347.w,
        height: 250.h,
        decoration: ShapeDecoration(
          color: Theme.of(context).colorScheme.inverseSurface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.r),
          ),
          shadows: [
            BoxShadow(
              color: const Color(0x3F000000),
              blurRadius: 8.r,
              offset: Offset(0, 4.h),
              spreadRadius: 0,
            )
          ],
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
                top: 29.h,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 26.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                  ),
                )),
            Positioned(
                top: 80.h,
                child: SizedBox(
                  width: 188.w,
                  height: 88.h,
                  child: Text(
                    description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontSize: 17.sp,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )),
            Positioned(
                top: 170.h,
                child: CustomButton(
                  height: 37.h,
                  width: 225.w,
                  borderRadius: 15.r,
                  color: Theme.of(context).colorScheme.secondary,
                  borderColor: Theme.of(context).colorScheme.secondary,
                  text: "اختيار",
                  fontColor: Colors.white,
                  onTap: onTap,
                ))
          ],
        ));
  }
}
