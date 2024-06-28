// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: camel_case_types
class reportsWidget extends StatelessWidget {
  String reportName;
  String caseInformation;
  reportsWidget({
    super.key,
    required this.reportName,
    required this.caseInformation,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 170.w,
              height: 170.w,
              decoration: ShapeDecoration(
                color: const Color(0xFFF2F4F7),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r),
                ),
              ),
              child: Padding(
                padding:  EdgeInsets.only(top: 57.h),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      Text(
                        reportName,
                        style:  TextStyle(
                          color: const Color(0xFF1B2A57),
                          fontSize: 16.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 0.h,
                        ),
                      ),
                       Text(
                        caseInformation,
                        textAlign: TextAlign.center,
                        style:  TextStyle(
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
              ),
            ),
          ],
        ),
      ],
    );
  }
}
