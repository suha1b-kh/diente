import 'package:diente/core/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@immutable
// ignore: must_be_immutable
class NotificationWidget extends StatelessWidget {
  NotificationWidget({super.key, required this.studentName});

  String studentName;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 18.w),
        child: Container(
            width: 200.w,
            height: 75.h,
            decoration: ShapeDecoration(
              color: const Color(0xFFF2F4F7),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Center(
              child: customText(
                  context,
                  '{$studentName} is accepte your case',
                  Theme.of(context).colorScheme.primary,
                  12.sp,
                  FontWeight.w500),
            )));
  }
}
