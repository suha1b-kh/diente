import 'dart:developer';
import 'dart:io';

import 'package:diente/auth/data/models/user.dart';
import 'package:diente/core/widgets/buttons.dart';
import 'package:diente/core/widgets/text.dart';
import 'package:diente/patient/presentation/widgets/custom_text_field.dart';
import 'package:diente/student/data/models/report_model.dart';
import 'package:diente/student/data/services/choose_case.dart';
import 'package:diente/student/data/services/reports_services.dart';
import 'package:diente/student/profile/screens/control_screen.dart';
import 'package:diente/student/profile/widgets/student_appbar.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';

class AddReportScreen extends StatefulWidget {
  const AddReportScreen({
    super.key,
    required this.caseName,
    required this.caseId,
    required this.patient,
  });
  final String caseName;
  final String caseId;
  final UserModel patient;

  @override
  State<AddReportScreen> createState() => _AddReportScreenState();
}

class _AddReportScreenState extends State<AddReportScreen> {
  File? _imageFile;

  final _picker = ImagePicker();
  String? downloadUrlString;

  Future _pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    File? imageFile = File(image.path);
    // imageFile = await _cropImage(imageFile: imageFile);
    imageFile = imageFile;
    setState(() {
      _imageFile = imageFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.only(top: 50.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'please add photo for your report to complete finish the case',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 24.sp,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
          Gap(50.w),
          _imageFile == null
              ? Image.asset('assets/images/p.png')
              : Image.file(
                  height: 150.w,
                  _imageFile!.absolute,
                  fit: BoxFit.cover,
                ),
          Gap(35.h),
          // CustomTextField(
          //   hint: 'add description',
          //   textAlign: TextAlign.center,
          //   inputType: TextInputType.text,
          //   obscureText: false,
          // ),
          Gap(20.h),
          customDialogButton(context, Theme.of(context).colorScheme.secondary,
              () async {
            await _pickImage(ImageSource.gallery);

            if (_imageFile != null) {
              //reference to the firebase storage
              final storageRef = FirebaseStorage.instance.ref();
              //upload the image to the firebase storage
              UploadTask task = storageRef
                  .child('reports_pic/${_imageFile!.path.split('/').last}')
                  .putFile(_imageFile!);
              //get the download url of the image
              task.whenComplete(() async {
                final downloadUrl = storageRef
                    .child('reports_pic/${_imageFile!.path.split('/').last}');
                downloadUrlString = await downloadUrl.getDownloadURL();
                log(downloadUrlString.toString());
              });
            }
            log('message');
            addReport(
              ReportModel(
                caseName: widget.caseName,
                reportPic: downloadUrlString!,
                reportId: widget.caseId,
              ),
            );

            finishCase(widget.caseId);

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('Report added successfully!'),
                backgroundColor: Theme.of(context).colorScheme.secondary,
                duration: const Duration(seconds: 1),
              ),
            );
            await Future.delayed(const Duration(seconds: 2));
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const ControlScreen()),
                (route) => false);
          }, 'select photo', 16.sp),
        ],
      ),
    ));
  }
}
