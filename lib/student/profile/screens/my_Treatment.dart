import 'package:diente/student/profile/widgets/list_for_student_and_treatment.dart';
import 'package:diente/student/profile/widgets/student_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTreatment extends StatelessWidget {
  const MyTreatment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const StudentAppbar()),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(top:46.h,bottom: 36.h),
              child: Text(
                'Treatment List',
                style: TextStyle(
                  color: const Color(0xFF1B2A57),
                  fontSize: 24.sp,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  height: 0.h,
                ),
              ),
            ),
            const ListWidgets(widgetType: WidgetType.treatment)
          ],
        ),
      ),
    );
  }
}
