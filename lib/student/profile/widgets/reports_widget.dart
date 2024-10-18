// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:diente/auth/data/models/user.dart';
import 'package:diente/core/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: camel_case_types
class reportsWidget extends StatelessWidget {
  final String reportName;
  final String CaseDescription;
  final String caseName;
  
   reportsWidget({
    super.key,
    required this.reportName,
    required this.CaseDescription,
    required this.caseName,
    
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          //widget
          width: 170.w,
          height: 170.w,
          decoration: ShapeDecoration(
            color: const Color(0xFFF2F4F7),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.r),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 57.h),
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    customText(
                        context,
                        caseName,
                        Theme.of(context).colorScheme.primary,
                        16.sp,
                        FontWeight.w500),
                    Text(
                      reportName, //Todo fetch student name from firebase

                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 16.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0.h,
                      ),
                    ),
                    Text(
                      CaseDescription,
                      //Todo fetch case info from firebase

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
            ),
          ),
        ),
      ],
    );
  }
}
