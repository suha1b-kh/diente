import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:panara_dialogs/panara_dialogs.dart';

import '../widgets/list_reports.dart';

// ignore: camel_case_types
class mainProfile extends StatelessWidget {
  const mainProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: SizedBox(
                width: 145.w,
                height: 145.h,
                child: Image.asset(
                  'assets/images/profile_photo.png',
                ),
              ),
            ),
            Text(
              'Diente student',
              style: TextStyle(
                color: const Color(0xFF1B2A57),
                fontSize: 20.sp,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 0.h,
              ),
            ),
            Gap(57.h),
            Text(
              'Diente student  Reports',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFF1B2A57),
                fontSize: 20.sp,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                height: 0.h,
              ),
            ),
            Gap(28.h),
            const listReportsView(),
          ],
        ),
      ),
      //TODO add reports
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          PanaraInfoDialog.showAnimatedGrow(
            context,
            title: "Hello",
            message: "This is the Panara Info Dialog Normal.",
            buttonText: "Okay",
            onTapDismiss: () {
              Navigator.pop(context);
            },
            panaraDialogType: PanaraDialogType.normal,
          );
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}
