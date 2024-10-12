import 'package:diente/student/profile/widgets/enum.dart';
import 'package:diente/student/profile/widgets/search_bar.dart';
import 'package:diente/student/profile/widgets/student_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class HomeStudentScreen extends StatelessWidget {
  const HomeStudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const StudentAppbar()),
      body: ListView(
        children: [
          Column(
            children: [
              Gap(29.h),
              const SearchStudentBar(),
              Gap(34.h),
              const ListWidgets(
                widgetType: WidgetType.patient,
              )
            ],
          ),
        ],
      ),
    );
  }
}
