import 'package:diente/student/data/models/student.dart';
import 'package:diente/student/data/services/student_login.dart';
import 'package:diente/student/profile/widgets/enum.dart';
import 'package:diente/student/profile/widgets/student_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ActiveCases extends StatelessWidget {
  ActiveCases({super.key});
  final Future<StudentModel> studentModelFuture =
      StudentServices().fetchStudent();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FutureBuilder<StudentModel>(
          future: StudentServices().fetchStudent(),
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
            ListWidgets(widgetType: WidgetType.active)
          ],
        ),
      ),
    );
  }
}
