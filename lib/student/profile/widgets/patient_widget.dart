import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

// ignore: must_be_immutable
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
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 18.w),
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
              radius: 20.r,
              child: Image.asset(
                'assets/images/pa_img.png',
                fit: BoxFit.cover,
              ),
            ),
            Gap(36.w),
            Column(
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
            Gap(70.w),
            Container(
              width: 10.w,
              height: 10.h,
              decoration: const ShapeDecoration(
                color: Color(0xFF11C72E),
                shape: CircleBorder(),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              onPressed: () {
                Navigator.of(context).pushNamed('/view_case_screen');
              },
            ),
          ],
        ),
      ),
    );
  }
}
