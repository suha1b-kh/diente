import 'dart:developer';
import 'dart:io';

import 'package:diente/core/widgets/buttons.dart';
import 'package:diente/core/widgets/text.dart';
import 'package:diente/patient/presentation/widgets/custom_text_field.dart';
import 'package:diente/student/data/models/report_model.dart';
import 'package:diente/student/data/services/reports_services.dart';
import 'package:diente/student/profile/widgets/student_appbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';

class AddReportScreen extends StatefulWidget {
  const AddReportScreen(
      {super.key, required this.caseName, required this.caseId});
  final String caseName;
  final String caseId;

  @override
  State<AddReportScreen> createState() => _AddReportScreenState();
}

class _AddReportScreenState extends State<AddReportScreen> {
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
        setState(() {});
        log('sss');
      }
    } catch (e) {
      log("Image selection error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _imageFile == null
            ? Image.asset('assets/images/p.png')
            : Image.file(
                height: 150.w,
                _imageFile!.absolute,
                fit: BoxFit.cover,
              ),
        Gap(35.h),
        customText(context, 'Add photo of your report',
            Theme.of(context).colorScheme.secondary, 14.sp, FontWeight.w400),
        Gap(35.h),
        CustomTextField(
          hint: 'add description',
          textAlign: TextAlign.center,
          inputType: TextInputType.text,
          obscureText: false,
        ),
        Gap(20.h),
        customDialogButton(context, Theme.of(context).colorScheme.secondary,
            () {
          _pickImage();
          log('message');
          addReport(
            ReportModel(
              caseName: widget.caseName,
              reportPic: _imageFile!.path,
              reportId: widget.caseId,
            ),
          );
        }, 'select photo', 16.sp),
      ],
    ));
  }
}
