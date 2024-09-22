// ignore_for_file: must_be_immutable

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diente/auth/data/models/user.dart';
import 'package:diente/auth/data/source/auth_firebase_service.dart';
import 'package:diente/auth/presentation/medical_history_screen.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import '../widgets/custom_button.dart';
import '../widgets/patient_image_and_name.dart';
import 'edit_email.dart';
import 'edit_password.dart';

class EditPatientProfileScreen extends StatefulWidget {
  String patientName = "";
  ImageProvider? patientImage;
  bool obscureText = true;

  //constructor
  EditPatientProfileScreen({
    super.key,
    required this.patientName,
    required this.patientImage,
  });

  @override
  State<EditPatientProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditPatientProfileScreen> {
  File? _imageFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: ListView(
        children: [
          // arrow icon button
          Container(
            margin: EdgeInsets.only(left: 8.w),
            height: 40.h,
            width: 40.w,
            alignment: Alignment.topLeft,
            child: IconButton(
                onPressed: () {
                  //TODO: Return to the previous screen
                  Navigator.pop(context);
                },
                //arrow icon
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  size: 23.sp,
                  color: Theme.of(context).colorScheme.primary,
                )),
          ),
          SizedBox(
            height: 12.h,
          ),
          //patient image and name
          PatientImageAndName(
              patientName: widget.patientName,
              patientImage: _imageFile == null
                  ? widget.patientImage
                  : FileImage(_imageFile!)),
          Gap(70.h),
          Center(
              child: CustomButton(
                  height: 37.h,
                  width: 230.w,
                  borderRadius: 50.r,
                  color: Theme.of(context).colorScheme.secondary,
                  borderColor: Theme.of(context).colorScheme.secondary,
                  text: "تغيير الصورة",
                  fontColor: Colors.white,
                  onTap: () async {
                    await _pickImage(ImageSource.gallery);
                    final storageRef = FirebaseStorage.instance.ref();
                    storageRef
                        .child(
                            'profile_pic/${_imageFile!.path.split('/').last}')
                        .putFile(_imageFile!);
                    final downloadUrl = storageRef.child(
                        'profile_pic/${_imageFile!.path.split('/').last}');

                    final downloadUrlString =
                        await downloadUrl.getDownloadURL();
                    final user = await AuthFirebaseService().fetchUser();
                    await FirebaseFirestore.instance
                        .collection('patients')
                        .doc(user.uid)
                        .update({'profile_pic': downloadUrlString});
                  })),
          Gap(40.h),
          //edit history button
          Center(
              child: CustomButton(
                  height: 37.h,
                  width: 230.w,
                  borderRadius: 50.r,
                  color: Theme.of(context).colorScheme.secondary,
                  borderColor: Theme.of(context).colorScheme.secondary,
                  text: "تعديل السجل المرضي",
                  fontColor: Colors.white,
                  onTap: () async {
                    UserModel user = await AuthFirebaseService().fetchUser();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return MedicalHistoryScreen(
                        user: user,
                      );
                    }));
                  })),
          SizedBox(
            height: 40.h,
          ),
          //Text field to enter the old password
          Center(
              child: CustomButton(
                  height: 37.h,
                  width: 230.w,
                  borderRadius: 50.r,
                  color: Theme.of(context).colorScheme.secondary,
                  borderColor: Theme.of(context).colorScheme.secondary,
                  text: "تعديل كلمة المرور",
                  fontColor: Colors.white,
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const EditPassword();
                    }));
                  })),
          SizedBox(
            height: 40.h,
          ),
          //button to save the new password
          Center(
              child: CustomButton(
                  height: 37.h,
                  width: 230.w,
                  borderRadius: 50.r,
                  color: Theme.of(context).colorScheme.secondary,
                  borderColor: Theme.of(context).colorScheme.secondary,
                  text: 'تعديل البريد الإلكتروني',
                  fontColor: Colors.white,
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const EditEmail();
                    }));
                  })),
        ],
      ),
    );
  }

  Future<File?> _cropImage({required File imageFile}) async {
    CroppedFile? croppedImage = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
    );

    if (croppedImage == null) {
      return null;
    } else {
      return File(croppedImage.path);
    }
  }

  Future _pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;
    File? imageFile = File(image.path);
    imageFile = await _cropImage(imageFile: imageFile);
    setState(() {
      _imageFile = imageFile;
    });
  }
}
