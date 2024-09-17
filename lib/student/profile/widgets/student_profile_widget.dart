import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StudentProfileWidget extends StatelessWidget {
   StudentProfileWidget({super.key,required this.studentName,required this.studentYear});
  String studentName;
  String studentYear;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 18),
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
                SizedBox(
                  width: 65.w,
                  height: 65.h,
                  child: Image.asset(
                    'assets/images/profile_photo.png',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, right: 71),
                  child: Column(
                    children: [
                      
                        
                         Text(
                          studentName,
                          style: TextStyle(
                            color: const Color(0xFF1B2A57),
                            fontSize: 16.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            height: 0.h,
                          ),
                        ),
                      
                      Text(
                        studentYear,
                        style: TextStyle(
                          color: const Color(0xFF7CA0CA),
                          fontSize: 14.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 0.h,
                        ),
                      )
                    ],
                  ),
                ),
               
                   Padding(
                  padding: EdgeInsets.only(left: 100.h),
                  child: const Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ),
        )
      ],
    ) ;
  }
}