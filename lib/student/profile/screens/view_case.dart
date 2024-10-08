import 'package:diente/core/widgets/buttons.dart';
import 'package:diente/core/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ViewCase extends StatelessWidget {
  const ViewCase({
    super.key,
    required this.patientName,
    required this.caseName,
    required this.toothNum,
    required this.phoneNum,
    required this.age,
    required this.medicalHistory,
  });
  final String patientName;
  final String caseName;
  final String toothNum;
  final String phoneNum;
  final String age;
  final Map medicalHistory;

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
            customText(context, patientName,
                Theme.of(context).colorScheme.primary, 20.sp, FontWeight.w600),
            customText(
                context,
                'case type: $caseName',
                Theme.of(context).colorScheme.secondary,
                24.sp,
                FontWeight.w500),
            customText(
                context,
                'tooth number: $toothNum',
                Theme.of(context).colorScheme.secondary,
                24.sp,
                FontWeight.w500),
            Gap(11.h),
            customText(
                context,
                'patient number: $phoneNum',
                Theme.of(context).colorScheme.secondary,
                20.sp,
                FontWeight.w500),
            Gap(11.h),
            customText(
                context,
                'patient age: $age',
                Theme.of(context).colorScheme.secondary,
                20.sp,
                FontWeight.w500),
            Gap(38.h),
            customText(
                context,
                'bleedingDisorders:  ${medicalHistory['bleedingDisorders']}',
                Theme.of(context).colorScheme.secondary,
                20.sp,
                FontWeight.w500),
            Gap(11.h),
            customText(
                context,
                'diabetes:  ${medicalHistory['diabetes']}',
                Theme.of(context).colorScheme.secondary,
                20.sp,
                FontWeight.w500),
            Gap(11.h),
            customText(
                context,
                'doNotSuffer:  ${medicalHistory['doNotSuffer']}',
                Theme.of(context).colorScheme.secondary,
                20.sp,
                FontWeight.w500),
            Gap(11.h),
            customText(
                context,
                'heartDisease:  ${medicalHistory['heartDisease']}',
                Theme.of(context).colorScheme.secondary,
                20.sp,
                FontWeight.w500),
            Gap(11.h),
            customText(
                context,
                'highBloodPressure:  ${medicalHistory['highBloodPressure']}',
                Theme.of(context).colorScheme.secondary,
                20.sp,
                FontWeight.w500),
            Gap(11.h),
            customText(
                context,
                'kidneyDisease:  ${medicalHistory['kidneyDisease']}',
                Theme.of(context).colorScheme.secondary,
                20.sp,
                FontWeight.w500),
            Gap(11.h),
            customText(
                context,
                'respiratoryDiseases:  ${medicalHistory['respiratoryDiseases']}',
                Theme.of(context).colorScheme.secondary,
                20.sp,
                FontWeight.w500),
            Gap(11.h),
            customButton(context, Theme.of(context).colorScheme.primary, () {
              //choose case
            }, 'Select case', 16)
          ],
        ),
      ),
    );
  }
}
