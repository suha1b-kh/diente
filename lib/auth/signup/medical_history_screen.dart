import 'package:diente/core/widgets/buttons.dart';
import 'package:diente/core/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class MedicalHistoryScreen extends StatelessWidget {
  const MedicalHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool diabetes = true,
        highBloodPressure = false,
        heartDisease = false,
        respiratoryDiseases = false,
        kidneyDisease = false,
        bleedingDisorders = false,
        doNotSuffer = false;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 38.w),
        child: ListView(
          children: [
            customText(
                context,
                'Do you suffer from one\nof the following diseases?',
                Theme.of(context).colorScheme.primary,
                20.sp,
                FontWeight.bold),
            Gap(60.h),
            Center(
              child: Row(
                children: [
                  Transform.scale(
                    scale: 1.3,
                    child: Checkbox(
                      side: MaterialStateBorderSide.resolveWith(
                        (states) => BorderSide(
                            width: 1.0,
                            color: Theme.of(context).colorScheme.secondary),
                      ),
                      value: diabetes,
                      onChanged: (value) {},
                      activeColor: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  Gap(13.w),
                  customText(
                      context,
                      'diabetes',
                      Theme.of(context).colorScheme.secondary,
                      16.sp,
                      FontWeight.w500),
                ],
              ),
            ),
            Gap(29.h),
            Center(
              child: Row(
                children: [
                  Transform.scale(
                    scale: 1.3,
                    child: Checkbox(
                      side: MaterialStateBorderSide.resolveWith(
                        (states) => BorderSide(
                            width: 1.0,
                            color: Theme.of(context).colorScheme.secondary),
                      ),
                      value: highBloodPressure,
                      onChanged: (value) {},
                      activeColor: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  Gap(13.w),
                  customText(
                      context,
                      'high blood pressure',
                      Theme.of(context).colorScheme.secondary,
                      16.sp,
                      FontWeight.w500),
                ],
              ),
            ),
            Gap(29.h),
            Center(
              child: Row(
                children: [
                  Transform.scale(
                    scale: 1.3,
                    child: Checkbox(
                      side: MaterialStateBorderSide.resolveWith(
                        (states) => BorderSide(
                            width: 1.0,
                            color: Theme.of(context).colorScheme.secondary),
                      ),
                      value: heartDisease,
                      onChanged: (value) {},
                      activeColor: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  Gap(13.w),
                  customText(
                      context,
                      'heart disease',
                      Theme.of(context).colorScheme.secondary,
                      16.sp,
                      FontWeight.w500),
                ],
              ),
            ),
            Gap(29.h),
            Center(
              child: Row(
                children: [
                  Transform.scale(
                    scale: 1.3,
                    child: Checkbox(
                      side: MaterialStateBorderSide.resolveWith(
                        (states) => BorderSide(
                            width: 1.0,
                            color: Theme.of(context).colorScheme.secondary),
                      ),
                      value: respiratoryDiseases,
                      onChanged: (value) {},
                      activeColor: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  Gap(13.w),
                  customText(
                      context,
                      'respiratory diseases',
                      Theme.of(context).colorScheme.secondary,
                      16.sp,
                      FontWeight.w500),
                ],
              ),
            ),
            Gap(29.h),
            Center(
              child: Row(
                children: [
                  Transform.scale(
                    scale: 1.3,
                    child: Checkbox(
                      side: MaterialStateBorderSide.resolveWith(
                        (states) => BorderSide(
                            width: 1.0,
                            color: Theme.of(context).colorScheme.secondary),
                      ),
                      value: kidneyDisease,
                      onChanged: (value) {},
                      activeColor: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  Gap(13.w),
                  customText(
                      context,
                      'Kidney Disease',
                      Theme.of(context).colorScheme.secondary,
                      16.sp,
                      FontWeight.w500),
                ],
              ),
            ),
            Gap(29.h),
            Center(
              child: Row(
                children: [
                  Transform.scale(
                    scale: 1.3,
                    child: Checkbox(
                      side: MaterialStateBorderSide.resolveWith(
                        (states) => BorderSide(
                            width: 1.0,
                            color: Theme.of(context).colorScheme.secondary),
                      ),
                      value: bleedingDisorders,
                      onChanged: (value) {},
                      activeColor: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  Gap(13.w),
                  customText(
                      context,
                      'Bleeding disorders',
                      Theme.of(context).colorScheme.secondary,
                      16.sp,
                      FontWeight.w500),
                ],
              ),
            ),
            Gap(29.h),
            Center(
              child: Row(
                children: [
                  Transform.scale(
                    scale: 1.3,
                    child: Checkbox(
                      side: MaterialStateBorderSide.resolveWith(
                        (states) => BorderSide(
                            width: 1.0,
                            color: Theme.of(context).colorScheme.secondary),
                      ),
                      value: doNotSuffer,
                      onChanged: (value) {},
                      activeColor: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  Gap(13.w),
                  customText(
                      context,
                      'I do not suffer from any\nchronic disease',
                      Theme.of(context).colorScheme.secondary,
                      16.sp,
                      FontWeight.w500),
                ],
              ),
            ),
            Gap(50.h),
            customButton(context, Theme.of(context).colorScheme.secondary, () {
              Navigator.popAndPushNamed(context, '/email_verification_screen');
            }, 'Submit', 16.sp)
          ],
        ),
      ),
    );
  }
}
