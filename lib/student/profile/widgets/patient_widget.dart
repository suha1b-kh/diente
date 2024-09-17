import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PatientWidget extends StatelessWidget {
   PatientWidget({
    super.key, 
   required this.patientName,
    required this.caseInformation,});
String patientName;
  String caseInformation;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(vertical: 15.h,horizontal: 18.h),
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
                Column(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(top: 20.h, right: 71.h),
                      child: Text(
                        patientName,
                        style: TextStyle(
                          color: const Color(0xFF1B2A57),
                          fontSize: 16.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 0.h,
                        ),
                      ),
                    ),
                    Text(
                      caseInformation,
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
                Padding(
                  padding:  EdgeInsets.only(left: 80.h),
                  child: Container(
                    
                    width: 10.w,
                    height: 10.h,
                    decoration: const ShapeDecoration(
                      color: Color(0xFF11C72E),
                      shape:CircleBorder(), 
                    ),
                  ),
                ),
                const Icon(Icons.arrow_forward_ios),
              ],
            ),
          ),
        )
      ],
    );
  }
}
