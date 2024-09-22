import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PatientWidget extends StatelessWidget {
  PatientWidget({
    super.key,
    required this.patientName,
    required this.caseInformation,
  });
  String patientName;
  String caseInformation;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 18.h),
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 28.r,
                  child: Image.asset(
                    'assets/images/profile_photo.png',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        patientName,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 16.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 0.h,
                        ),
                      ),
                      Text(
                        caseInformation,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
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
                  padding: EdgeInsets.only(left: 130.h),
                  child: Container(
                    width: 10.w,
                    height: 10.h,
                    decoration: const ShapeDecoration(
                      color: Color(0xFF11C72E),
                      shape: CircleBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.h),
                  child: const Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
