import 'package:diente/core/widgets/text.dart';
import 'package:diente/student/data/models/student.dart';
import 'package:diente/student/data/services/student_login.dart';
import 'package:diente/student/profile/widgets/enum.dart';
import 'package:diente/student/profile/widgets/search_bar.dart';
import 'package:diente/student/profile/widgets/student_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class Students extends StatelessWidget {
  Students({super.key});
  final Future<StudentModel> studentModelFuture =
      StudentServices().fetchStudent();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FutureBuilder<StudentModel>(
          future: studentModelFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              return StudentAppbar(student: snapshot.data!);
            } else {
              return const Text('No Data');
            }
          },
        ),
      ),
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
