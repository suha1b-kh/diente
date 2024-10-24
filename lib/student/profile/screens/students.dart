import 'package:diente/core/widgets/text.dart';
import 'package:diente/student/profile/widgets/enum.dart';
import 'package:diente/student/profile/widgets/search_bar.dart';
import 'package:diente/student/profile/widgets/student_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class Students extends StatelessWidget {
  const Students({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const StudentAppbar()),
      body: ListView(
        children: [
          Column(
            children: [
              Gap(29.h),
              // const SearchStudentBar(),
              customText(
                  context,
                  'Diente students',
                  Theme.of(context).colorScheme.primary,
                  28.sp,
                  FontWeight.bold),
              Gap(34.h),
             ListWidgets(
                widgetType: WidgetType.studentProfile,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
