// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  String hint = "";
  TextAlign textAlign = TextAlign.start;
  bool obscureText = false;
  TextInputType inputType = TextInputType.text;
  int maxLength = 0;
  String? input = "";
  IconButton? icon;
  TextEditingController? controller;

  //constructor
  CustomTextField({
    super.key,
    required this.hint,
    required this.textAlign,
    required this.inputType,
    required this.obscureText,
    this.controller,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    //Text field
    return Container(
      width: 330.w,
      height: 56.r,
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: inputType,
        textAlign: textAlign,
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Theme.of(context).colorScheme.inverseSurface,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
              borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.inverseSurface)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
              borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.inverseSurface)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
              borderSide: const BorderSide(color: Colors.red)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
              borderSide: const BorderSide(color: Colors.red)),
          hintText: hint,
          hintStyle: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary,
            fontSize: 16.sp,
            fontFamily: 'NotoSansArabic',
            fontWeight: FontWeight.w400,
          ),
          suffixIcon: icon,
        ),
      ),
    );
  }
}
