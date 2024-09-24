import 'dart:developer';
import 'dart:io';

import 'package:diente/core/widgets/buttons.dart';
import 'package:diente/core/widgets/text.dart';
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
            const listReportsView(),
          ],
        ),
      ),
      //TODO add reports
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context, builder: (context) => customDialog());
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget customDialog() {
    return Dialog(
        child: Container(
      width: 347,
      height: 384,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(30.w),
        child: Center(
          child: selectPhotoDialog(),
        ),
      ),
    ));
  }

  Column selectPhotoDialog() {
    return Column(
      children: [
        _imageFile == null
            ? Image.asset('assets/images/p.png')
            : Image.file(
                _imageFile!.absolute,
                fit: BoxFit.cover,
              ),
        Gap(35.h),
        customText(context, 'Add photos of your report',
            Theme.of(context).colorScheme.secondary, 14.sp, FontWeight.w400),
        Gap(35.h),
        customDialogButton(context, Theme.of(context).colorScheme.secondary,
            () {
          setState(() {
            _pickImage();
            log('ss');
          });
          log('message');
        }, 'select photo', 16.sp),
      ],
    );
  }
}
