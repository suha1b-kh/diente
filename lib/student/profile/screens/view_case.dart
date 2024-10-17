import 'dart:developer';
import 'dart:io';

import 'package:diente/core/widgets/buttons.dart';
import 'package:diente/core/widgets/text.dart';
import 'package:diente/patient/presentation/widgets/custom_text_field.dart';
import 'package:diente/student/data/models/report_model.dart';
import 'package:diente/student/data/services/choose_case.dart';
import 'package:diente/student/data/services/reports_services.dart';
import 'package:diente/student/profile/screens/add_report_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';

class ViewCase extends StatelessWidget {
  const ViewCase({
    super.key,
    required this.patientName,
    required this.caseName,
    required this.toothNum,
    required this.phoneNum,
    required this.age,
    required this.medicalHistory,
    required this.caseId,
    required this.profilePic,
  });
  final String patientName;
  final String caseName;
  final String toothNum;
  final String phoneNum;
  final String age;
  final Map medicalHistory;
  final String caseId;
  final String profilePic;

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
            CircleAvatar(
              backgroundImage: NetworkImage(profilePic),
              radius: 70.r,
            ),
            Gap(20.w),
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
              chooseCase(caseId);
            }, 'Select case', 16)
          ],
        ),
      ),
    );
  }
}

// view active case
/*
*
*
*
*
*
*
*
*
*/
class ViewActiveCase extends StatefulWidget {
  const ViewActiveCase({
    super.key,
    required this.patientName,
    required this.caseName,
    required this.toothNum,
    required this.phoneNum,
    required this.age,
    required this.medicalHistory,
    required this.caseId,
    required this.profilePic,
  });
  final String patientName;
  final String caseName;
  final String toothNum;
  final String phoneNum;
  final String age;
  final Map medicalHistory;
  final String caseId;
  final String profilePic;

  @override
  State<ViewActiveCase> createState() => _ViewActiveCaseState();
}

class _ViewActiveCaseState extends State<ViewActiveCase> {
  File? _imageFile;

  final _picker = ImagePicker();

  Future<void> _pickImage() async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery, // Pick from gallery
      );

      // If a file is picked, update the state to display it
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
        log('sss');
      }
    } catch (e) {
      log("Image selection error: $e");
    }
  }

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
            CircleAvatar(
              backgroundImage: NetworkImage(widget.profilePic),
              radius: 70.r,
            ),
            Gap(20.w),
            customText(context, widget.patientName,
                Theme.of(context).colorScheme.primary, 20.sp, FontWeight.w600),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customText(
                      context,
                      'case type: ${widget.caseName}',
                      Theme.of(context).colorScheme.secondary,
                      20.sp,
                      FontWeight.w500),
                  customText(
                      context,
                      'tooth number: ${widget.toothNum}',
                      Theme.of(context).colorScheme.secondary,
                      20.sp,
                      FontWeight.w500),
                  Gap(11.h),
                  customText(
                      context,
                      'patient number: ${widget.phoneNum}',
                      Theme.of(context).colorScheme.secondary,
                      20.sp,
                      FontWeight.w500),
                  Gap(11.h),
                  customText(
                      context,
                      'patient age: ${widget.age}',
                      Theme.of(context).colorScheme.secondary,
                      20.sp,
                      FontWeight.w500),
                ],
              ),
            ),
            Gap(38.h),
            Container(
              padding: EdgeInsets.all(20.w),
              width: 355.w,
              decoration: ShapeDecoration(
                color: Theme.of(context).colorScheme.secondary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customText(
                      context,
                      'Medical History',
                      Theme.of(context).colorScheme.surface,
                      22.sp,
                      FontWeight.bold),
                  Divider(
                    color: Theme.of(context).colorScheme.surface,
                    thickness: 1,
                  ),
                  Gap(11.h),
                  customText(
                      context,
                      'Bleeding Disorders: ${widget.medicalHistory['bleedingDisorders']}',
                      Theme.of(context).colorScheme.surface,
                      18.sp,
                      FontWeight.w400),
                  Gap(11.h),
                  customText(
                      context,
                      'Diabetes: ${widget.medicalHistory['diabetes']}',
                      Theme.of(context).colorScheme.surface,
                      18.sp,
                      FontWeight.w400),
                  Gap(11.h),
                  customText(
                      context,
                      'Do Not Suffer: ${widget.medicalHistory['doNotSuffer']}',
                      Theme.of(context).colorScheme.surface,
                      18.sp,
                      FontWeight.w400),
                  Gap(11.h),
                  customText(
                      context,
                      'Heart Disease: ${widget.medicalHistory['heartDisease']}',
                      Theme.of(context).colorScheme.surface,
                      18.sp,
                      FontWeight.w400),
                  Gap(11.h),
                  customText(
                      context,
                      'High Blood Pressure: ${widget.medicalHistory['highBloodPressure']}',
                      Theme.of(context).colorScheme.surface,
                      18.sp,
                      FontWeight.w400),
                  Gap(11.h),
                  customText(
                      context,
                      'Kidney Disease: ${widget.medicalHistory['kidneyDisease']}',
                      Theme.of(context).colorScheme.surface,
                      18.sp,
                      FontWeight.w400),
                  Gap(11.h),
                  customText(
                      context,
                      'Respiratory Diseases: ${widget.medicalHistory['respiratoryDiseases']}',
                      Theme.of(context).colorScheme.surface,
                      18.sp,
                      FontWeight.w400),
                ],
              ),
            ),
            customButton(context, Theme.of(context).colorScheme.primary, () {
              log('Patient found ${widget.caseId}jkl');

              showDialog(
                  context: context,
                  builder: (context) => AddReportScreen(
                        caseName: widget.caseName,
                        caseId: widget.caseId,
                      ));
            }, 'Finish Case', 16)
          ],
        ),
      ),
    );
  }
}
