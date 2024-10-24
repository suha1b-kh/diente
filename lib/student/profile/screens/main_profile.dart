import 'dart:developer';
import 'dart:io';

import 'package:diente/core/widgets/buttons.dart';
import 'package:diente/core/widgets/text.dart';
import 'package:diente/patient/presentation/widgets/custom_text_field.dart';
import 'package:diente/student/data/models/report_model.dart';
import 'package:diente/student/data/services/choose_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';

import '../widgets/list_reports.dart';

// ignore: camel_case_types
class MainStudentProfile extends StatefulWidget {
  const MainStudentProfile({super.key});

  @override
  State<MainStudentProfile> createState() => _mainProfileState();
}

class _mainProfileState extends State<MainStudentProfile> {
  File? _imageFile;
  final _picker = ImagePicker();

  Future<void> _pickImage() async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery, // Pick from gallery
      );

      // If a file is picked, update the state to display it
      if (pickedFile != null) {
        //TODO: refactor using bloc
        setState(() {
          _imageFile = File(pickedFile.path);
          log('sss');
        });
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
            Center(
              child: MaterialButton(
                onPressed: () =>
                    Navigator.of(context).pushNamed('/edit_profile'),
                child: ClipOval(
                    child: Image.asset(
                  'assets/images/stu_img.png',
                  width: 145.w,
                  height: 145.h,
                  fit: BoxFit.cover,
                )),
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
             listReportsView(),
          ],
        ),
      ),
      //TODO add reports
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //TODO: sad
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
