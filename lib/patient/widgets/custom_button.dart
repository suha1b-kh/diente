import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  double height = 0.0;
  double width = 0.0;
  double borderRadius;
  Color color = const Color(0xFF7CA0CA);
  Color borderColor = const Color(0xFF7CA0CA);
  String text = "";
  Color fontColor;

  VoidCallback onTap;

  //constructor
  CustomButton(
      {required this.width,
      required this.height,
      required this.color,
      required this.fontColor,
      required this.borderColor,
      required this.borderRadius,
      required this.text,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      //button decoration
      child: Container(
        margin: EdgeInsets.only(top: 16.h, left: 10.w, right: 10.w),
        width: width,
        height: height,
        decoration: ShapeDecoration(
          color: color,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: borderColor, width: 2.w),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        //The text written on the button
        child: Center(
            child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: fontColor,
            fontSize: 18.sp,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        )),
      ),
    );
  }
}
