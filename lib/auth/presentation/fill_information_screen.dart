import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diente/auth/data/models/user.dart';
import 'package:diente/auth/data/source/auth_firebase_service.dart';
import 'package:diente/auth/presentation/medical_history_screen.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:diente/core/widgets/buttons.dart';
import 'package:diente/core/widgets/drop_down_menu.dart';
import 'package:diente/core/widgets/text.dart';
import 'package:diente/core/widgets/text_fields.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class FillProfileScreen extends StatefulWidget {
  const FillProfileScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FillProfileScreenState createState() => _FillProfileScreenState();
}

class _FillProfileScreenState extends State<FillProfileScreen> {
  final userAuth = FirebaseAuth.instance.currentUser;

  // Controllers for the text fields
  TextEditingController firstnameController = TextEditingController();
  TextEditingController secondnameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController genderController =
      TextEditingController(text: 'gender');
  TextEditingController phoneNumberController = TextEditingController();

  // List for the user's medical history
  List<Map<String, bool>> medicalHistory = [];

  //validate
  GlobalKey<FormState> formKey = GlobalKey(); //to validate form

  String? validateField(String? value) {
    if (value == null || value.isEmpty || value == 'gender') {
      return 'This field cannot be empty';
    }
    return null;
  }

  // Variables for image picking
  File? _imageFile;
  String? downloadUrlString;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/home_screen');
          },
        ),
        title: customText(
          context,
          'Fill Profile',
          Theme.of(context).colorScheme.primary,
          14.sp,
          FontWeight.bold,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Center(
          child: ListView(
            children: [
              Gap(44.h),
              GestureDetector(
                onTap: () async {
                  await _pickImage(ImageSource.gallery);
                },
                child: _imageFile == null
                    ? const Center(
                        child: CircleAvatar(
                          radius: 61,
                          backgroundImage: NetworkImage(
                              'https://firebasestorage.googleapis.com/v0/b/diente-e540a.appspot.com/o/profile_pic%2F909657-profile_pic.png?alt=media&token=927fbec3-22af-4cdc-84ec-3b0cd8038ca0'),
                          //AssetImage('assets/images/profile_photo.png'),
                        ),
                      )
                    : Center(
                        child: CircleAvatar(
                          radius: 61.w,
                          backgroundImage: FileImage(
                            _imageFile!,
                          ),
                        ),
                      ),
              ),
              Gap(26.h),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        CustomTextField(
                          validator: validateField,
                          controller: firstnameController,
                          text: 'First name',
                          width: (330 / 2).w,
                          height: 56.h,
                        ),
                        Gap(10.w),
                        CustomTextField(
                          validator: validateField,
                          controller: secondnameController,
                          text: 'Second name',
                          width: (330 / 2).w,
                          height: 56.h,
                        ),
                      ],
                    ),
                    Gap(10.h),
                    CustomTextField(
                      validator: validateField,
                      keyboardType: TextInputType.number,
                      controller: ageController,
                      text: 'Age',
                      width: 343.w,
                      height: 56.h,
                    ),
                    Gap(10.h),
                    CustomDropDownMenu(
                      validator: validateField,
                      width: 343.w,
                      height: 56.h,
                      text: genderController.text,
                      items: const ['Male', 'Female'],
                      selectedItem: null,
                      onChanged: (String? newValue) {
                        setState(() {
                          genderController.text = newValue ?? '';
                        });
                        //TODO: Refactor using bloc
                      },
                    ),
                    Gap(10.h),
                    CustomTextField(
                      validator: validateField,
                      keyboardType: TextInputType.phone,
                      controller: phoneNumberController,
                      text: 'Phone number',
                      width: 343.w,
                      height: 56.h,
                    ),
                  ],
                ),
              ),
              Gap(94.h),
              customButton(
                context,
                Theme.of(context).colorScheme.secondary,
                () async {
                  if (_imageFile != null) {
                    //reference to the firebase storage
                    final storageRef = FirebaseStorage.instance.ref();
                    //upload the image to the firebase storage
                    UploadTask task = storageRef
                        .child(
                            'profile_pic/${_imageFile!.path.split('/').last}')
                        .putFile(_imageFile!);
                    //get the download url of the image
                    task.whenComplete(() async {
                      final downloadUrl = storageRef.child(
                          'profile_pic/${_imageFile!.path.split('/').last}');
                      downloadUrlString = await downloadUrl.getDownloadURL();
                      log(downloadUrlString.toString());
                    });
                  } else {
                    downloadUrlString =
                        "https://firebasestorage.googleapis.com/v0/b/diente-e540a.appspot.com/o/profile_pic%2F909657-profile_pic.png?alt=media&token=927fbec3-22af-4cdc-84ec-3b0cd8038ca0";
                  }
                  if (formKey.currentState!.validate()) {
                    UserModel user = UserModel(
                      age: ageController.text,
                      email: userAuth!.email.toString(),
                      firstName: firstnameController.text,
                      secondName: secondnameController.text,
                      profilePic: downloadUrlString!,
                      gender: genderController.text,
                      medicalHistory: <String, dynamic>{},
                      phoneNum: phoneNumberController.text,
                    );

                    try {
                      AuthFirebaseService().createUser(user);
                    } catch (e) {
                      log(e.toString());
                    }
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return MedicalHistoryScreen(
                        user: user,
                      );
                    }));
                  }
                },
                'Continue',
                16.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Future<File?> _cropImage({required File imageFile}) async {
  //   CroppedFile? croppedImage = await ImageCropper().cropImage(
  //     sourcePath: imageFile.path,
  //     aspectRatioPresets: [
  //       CropAspectRatioPreset.square,
  //       CropAspectRatioPreset.ratio3x2,
  //       CropAspectRatioPreset.original,
  //       CropAspectRatioPreset.ratio4x3,
  //       CropAspectRatioPreset.ratio16x9
  //     ],
  //   );

  //   if (croppedImage == null) {
  //     return null;
  //   } else {
  //     return File(croppedImage.path);
  //   }
  // }

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
}
