import 'package:diente/core/widgets/buttons.dart';
import 'package:diente/core/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ViewCase extends StatelessWidget {
  const ViewCase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipOval(
                //TODO fetch image from firestore
                child: Image.asset(
              'assets/images/stu_img.png',
              width: 131.w,
              height: 131.h,
              fit: BoxFit.cover,
            )),
            Gap(14.h),
            customText(
                context,
                'patient name', //TODO fetch patient name from firestore
                Theme.of(context).colorScheme.primary,
                20.sp,
                FontWeight.w600),
            customText(
                context,
                'Routine examination',
                Theme.of(context).colorScheme.secondary,
                24.sp,
                FontWeight.w500),
            Gap(11.h),
            customText(
                context,
                'Phone number', //TODO fetch phone number from firestore
                Theme.of(context).colorScheme.secondary,
                20.sp,
                FontWeight.w500),
            Gap(11.h),
            customText(context, 'Age', Theme.of(context).colorScheme.secondary,
                20.sp, FontWeight.w500), //TODO fetch age from firestore
            Gap(38.h),
            //TODO fetch medical history from firestore
            customText(context, 'Age', Theme.of(context).colorScheme.secondary,
                20.sp, FontWeight.w500),
            Gap(11.h),
            customText(context, 'Age', Theme.of(context).colorScheme.secondary,
                20.sp, FontWeight.w500),
            Gap(11.h),
            customText(context, 'Age', Theme.of(context).colorScheme.secondary,
                20.sp, FontWeight.w500),
            Gap(11.h),
            customText(context, 'Age', Theme.of(context).colorScheme.secondary,
                20.sp, FontWeight.w500),
            Gap(11.h),
            customText(context, 'Age', Theme.of(context).colorScheme.secondary,
                20.sp, FontWeight.w500),
            Gap(11.h),
            customText(context, 'Age', Theme.of(context).colorScheme.secondary,
                20.sp, FontWeight.w500),
            Gap(11.h),
            customText(context, 'Age', Theme.of(context).colorScheme.secondary,
                20.sp, FontWeight.w500),
            Gap(11.h),
            customButton(context, Theme.of(context).colorScheme.primary, () {},
                'Select case', 16)
          ],
        ),
      ),
    );
  }
}
