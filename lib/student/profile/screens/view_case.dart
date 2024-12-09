import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diente/auth/data/models/user.dart';
import 'package:diente/core/widgets/buttons.dart';
import 'package:diente/core/widgets/text.dart';
import 'package:diente/patient/presentation/widgets/custom_text_field.dart';
import 'package:diente/student/data/models/report_model.dart';
import 'package:diente/student/data/services/choose_case.dart';
import 'package:diente/student/data/services/reports_services.dart';
import 'package:diente/student/profile/screens/add_report_screen.dart';
import 'package:firebase_core/firebase_core.dart';
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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(profilePic),
                radius: 70.r,
              ),
              Gap(20.h),
              customText(
                context,
                patientName,
                Theme.of(context).colorScheme.primary,
                32.sp,
                FontWeight.w500,
              ),
              Gap(20.w),
              ExpansionTile(
                shape: const RoundedRectangleBorder(
                  side: BorderSide.none,
                ),
                iconColor: Theme.of(context).colorScheme.primary,
                childrenPadding: EdgeInsets.zero,
                tilePadding: EdgeInsets.zero,
                collapsedIconColor: Theme.of(context).colorScheme.primary,
                title: customText(
                    context,
                    'Patient Information',
                    Theme.of(context).colorScheme.primary,
                    20.sp,
                    FontWeight.w600),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customText(
                        context,
                        'Case Name:',
                        Theme.of(context).colorScheme.primary,
                        20.sp,
                        FontWeight.w500,
                      ),
                      customText(
                        context,
                        caseName,
                        Theme.of(context).colorScheme.primary,
                        20.sp,
                        FontWeight.w500,
                      ),
                    ],
                  ),
                  Gap(11.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customText(
                        context,
                        'Tooth Number:',
                        Theme.of(context).colorScheme.primary,
                        20.sp,
                        FontWeight.w500,
                      ),
                      customText(
                        context,
                        toothNum,
                        Theme.of(context).colorScheme.primary,
                        20.sp,
                        FontWeight.w500,
                      ),
                    ],
                  ),
                  Gap(11.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customText(
                        context,
                        'Phone Number:',
                        Theme.of(context).colorScheme.primary,
                        20.sp,
                        FontWeight.w500,
                      ),
                      customText(
                        context,
                        phoneNum,
                        Theme.of(context).colorScheme.primary,
                        20.sp,
                        FontWeight.w500,
                      ),
                    ],
                  ),
                  Gap(11.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customText(
                        context,
                        'Age:',
                        Theme.of(context).colorScheme.primary,
                        20.sp,
                        FontWeight.w500,
                      ),
                      customText(
                        context,
                        age,
                        Theme.of(context).colorScheme.primary,
                        20.sp,
                        FontWeight.w500,
                      ),
                    ],
                  ),
                ],
              ),
              Gap(50.h),
              ExpansionTile(
                shape: const RoundedRectangleBorder(
                  side: BorderSide.none,
                ),
                iconColor: Theme.of(context).colorScheme.primary,
                childrenPadding: EdgeInsets.zero,
                tilePadding: EdgeInsets.zero,
                collapsedIconColor: Theme.of(context).colorScheme.primary,
                title: customText(
                    context,
                    'Medical History',
                    Theme.of(context).colorScheme.primary,
                    20.sp,
                    FontWeight.w600),
                children: [
                  if (medicalHistory['bleedingDisorders'] == true)
                    ListTile(
                      title: customText(
                          context,
                          'Bleeding Disorders',
                          Theme.of(context).colorScheme.primary,
                          20.sp,
                          FontWeight.w500),
                    ),
                  if (medicalHistory['diabetes'] == true)
                    ListTile(
                      title: customText(
                          context,
                          'Diabetes',
                          Theme.of(context).colorScheme.primary,
                          20.sp,
                          FontWeight.w500),
                    ),
                  if (medicalHistory['heartDisease'] == true)
                    ListTile(
                      title: customText(
                          context,
                          'Heart Disease',
                          Theme.of(context).colorScheme.primary,
                          20.sp,
                          FontWeight.w500),
                    ),
                  if (medicalHistory['highBloodPressure'] == true)
                    ListTile(
                      title: customText(
                          context,
                          'High Blood Pressure',
                          Theme.of(context).colorScheme.primary,
                          20.sp,
                          FontWeight.w500),
                    ),
                  if (medicalHistory['kidneyDisease'] == true)
                    ListTile(
                      title: customText(
                          context,
                          'Kidney Disease',
                          Theme.of(context).colorScheme.primary,
                          20.sp,
                          FontWeight.w500),
                    ),
                  if (medicalHistory['respiratoryDiseases'] == true)
                    ListTile(
                      title: customText(
                          context,
                          'Respiratory Diseases',
                          Theme.of(context).colorScheme.primary,
                          20.sp,
                          FontWeight.w500),
                    ),
                  if (medicalHistory['doNotSuffer'] == true)
                    ListTile(
                      title: customText(
                          context,
                          'Do Not Suffer',
                          Theme.of(context).colorScheme.primary,
                          20.sp,
                          FontWeight.w500),
                    ),
                ],
              ),
              Gap(150.h),
              customButton(context, Theme.of(context).colorScheme.primary, () {
                chooseCase(caseId);
                Navigator.pop(context);
              }, 'Select case', 16)
            ],
          ),
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
    required this.patient,
    required this.caseName,
    required this.toothNum,
    required this.caseId,
  });
  final UserModel patient;
  final String caseName;
  final String toothNum;
  final String caseId;

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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(widget.patient.profilePic),
                radius: 70.r,
              ),
              Gap(20.w),
              customText(
                  context,
                  '${widget.patient.firstName} ${widget.patient.secondName}',
                  Theme.of(context).colorScheme.primary,
                  32.sp,
                  FontWeight.w600),
              Gap(20.h),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ExpansionTile(
                      shape: const RoundedRectangleBorder(
                        side: BorderSide.none,
                      ),
                      iconColor: Theme.of(context).colorScheme.primary,
                      childrenPadding: EdgeInsets.zero,
                      tilePadding: EdgeInsets.zero,
                      collapsedIconColor: Theme.of(context).colorScheme.primary,
                      title: customText(
                          context,
                          'Patient Information',
                          Theme.of(context).colorScheme.primary,
                          20.sp,
                          FontWeight.w600),
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customText(
                              context,
                              'Case Name:',
                              Theme.of(context).colorScheme.primary,
                              20.sp,
                              FontWeight.w500,
                            ),
                            customText(
                              context,
                              widget.caseName,
                              Theme.of(context).colorScheme.primary,
                              20.sp,
                              FontWeight.w500,
                            ),
                          ],
                        ),
                        Gap(11.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customText(
                              context,
                              'Tooth Number:',
                              Theme.of(context).colorScheme.primary,
                              20.sp,
                              FontWeight.w500,
                            ),
                            customText(
                              context,
                              widget.toothNum,
                              Theme.of(context).colorScheme.primary,
                              20.sp,
                              FontWeight.w500,
                            ),
                          ],
                        ),
                        Gap(11.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customText(
                              context,
                              'Phone Number:',
                              Theme.of(context).colorScheme.primary,
                              20.sp,
                              FontWeight.w500,
                            ),
                            customText(
                              context,
                              widget.patient.phoneNum,
                              Theme.of(context).colorScheme.primary,
                              20.sp,
                              FontWeight.w500,
                            ),
                          ],
                        ),
                        Gap(11.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customText(
                              context,
                              'Age:',
                              Theme.of(context).colorScheme.primary,
                              20.sp,
                              FontWeight.w500,
                            ),
                            customText(
                              context,
                              widget.patient.age,
                              Theme.of(context).colorScheme.primary,
                              20.sp,
                              FontWeight.w500,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Gap(38.h),
              ExpansionTile(
                shape: const RoundedRectangleBorder(
                  side: BorderSide.none,
                ),
                iconColor: Theme.of(context).colorScheme.primary,
                childrenPadding: EdgeInsets.zero,
                tilePadding: EdgeInsets.zero,
                collapsedIconColor: Theme.of(context).colorScheme.primary,
                title: customText(
                    context,
                    'Medical History',
                    Theme.of(context).colorScheme.primary,
                    20.sp,
                    FontWeight.w600),
                children: [
                  CheckboxListTile(
                    title: customText(
                        context,
                        'Bleeding Disorders',
                        Theme.of(context).colorScheme.primary,
                        20.sp,
                        FontWeight.w500),
                    value: widget.patient.medicalHistory['bleedingDisorders'],
                    onChanged: (bool? value) {},
                  ),
                  CheckboxListTile(
                    title: customText(
                        context,
                        'Diabetes',
                        Theme.of(context).colorScheme.primary,
                        20.sp,
                        FontWeight.w500),
                    value: widget.patient.medicalHistory['diabetes'],
                    onChanged: (bool? value) {},
                  ),
                  CheckboxListTile(
                    title: customText(
                        context,
                        'Heart Disease',
                        Theme.of(context).colorScheme.primary,
                        20.sp,
                        FontWeight.w500),
                    value: widget.patient.medicalHistory['heartDisease'],
                    onChanged: (bool? value) {},
                  ),
                  CheckboxListTile(
                    title: customText(
                        context,
                        'High Blood Pressure',
                        Theme.of(context).colorScheme.primary,
                        20.sp,
                        FontWeight.w500),
                    value: widget.patient.medicalHistory['highBloodPressure'],
                    onChanged: (bool? value) {},
                  ),
                  CheckboxListTile(
                    title: customText(
                        context,
                        'Kidney Disease',
                        Theme.of(context).colorScheme.primary,
                        20.sp,
                        FontWeight.w500),
                    value: widget.patient.medicalHistory['kidneyDisease'],
                    onChanged: (bool? value) {},
                  ),
                  CheckboxListTile(
                    title: customText(
                        context,
                        'Respiratory Diseases',
                        Theme.of(context).colorScheme.primary,
                        20.sp,
                        FontWeight.w500),
                    value: widget.patient.medicalHistory['respiratoryDiseases'],
                    onChanged: (bool? value) {},
                  ),
                  CheckboxListTile(
                    title: customText(
                        context,
                        'Do Not Suffer',
                        Theme.of(context).colorScheme.primary,
                        20.sp,
                        FontWeight.w500),
                    value: widget.patient.medicalHistory['doNotSuffer'],
                    onChanged: (bool? value) {},
                  ),
                ],
              ),
              Gap(150.h),
              customButton(context, Theme.of(context).colorScheme.primary, () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddReportScreen(
                              caseName: widget.caseName,
                              caseId: widget.caseId,
                              patient: widget.patient,
                            )));
              }, 'Finish Case', 16),
              customButton(context, Colors.red, () {
                FirebaseFirestore.instance
                    .collection('acceptedRequests')
                    .doc(widget.caseId)
                    .update({'caseStatus': 'accepted'});
                Navigator.pop(context);
              }, 'stop treating this case', 16),
            ],
          ),
        ),
      ),
    );
  }
}
