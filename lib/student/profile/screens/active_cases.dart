import 'package:diente/student/profile/widgets/enum.dart';
import 'package:diente/student/profile/widgets/student_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ActiveCases extends StatelessWidget {
  const ActiveCases({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const StudentAppbar()),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Gap(29.h),
            Text(
              'active List ',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 28.sp,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                height: 0.h,
              ),
            ),
            const ListWidgets(widgetType: WidgetType.active)
          ],
        ),
      ),
    );
  }
}
