import 'dart:developer';
import 'dart:io';
import 'package:diente/auth/data/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:diente/core/widgets/buttons.dart';
import 'package:diente/core/widgets/drop_down_menu.dart';
import 'package:diente/core/widgets/text.dart';
import 'package:diente/core/widgets/text_fields.dart';
// import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../patient/presentation/Home/patient_home_screen.dart';

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

  // Variables for image picking
  File? _imageFile;
  File? croppedImage;
  final ImagePicker _picker = ImagePicker();

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
                  await _pickImage();
                },
                child: _imageFile == null
                    ? Image.asset(
                        'assets/images/profile_photo.png', // Default image
                        width: 122.w,
                        height: 122.h,
                        // fit: BoxFit.cover,
                      )
                    : CircleAvatar(
                        radius: 61.w,
                        backgroundImage: FileImage(_imageFile!),
                      ),
              ),
              Gap(26.h),
              Row(
                children: [
                  CustomTextField(
                    controller: firstnameController,
                    text: 'First name',
                    width: 330 / 2.w,
                    height: 56.h,
                  ),
                  Gap(10.w),
                  CustomTextField(
                    controller: secondnameController,
                    text: 'Second name',
                    width: 330 / 2.w,
                    height: 56.h,
                  ),
                ],
              ),
              Gap(10.h),
              CustomTextField(
                controller: ageController,
                text: 'Age',
                width: 343.w,
                height: 56.h,
              ),
              Gap(10.h),
              CustomDropDownMenu(
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
                controller: phoneNumberController,
                text: 'Phone number',
                width: 343.w,
                height: 56.h,
              ),
              Gap(94.h),
              customButton(
                context,
                Theme.of(context).colorScheme.secondary,
                () {
                  log('first name: ${firstnameController.text}');
                  log('second name: ${secondnameController.text}');
                  log('Age: ${ageController.text}');
                  log('Gender: ${genderController.text}');
                  log('Phone number: ${phoneNumberController.text}');
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    UserModel user = UserModel(
                      age: ageController.text,
                      email: userAuth!.email.toString(),
                      firstName: firstnameController.text,
                      secondName: secondnameController.text,
                      profilePic: '',
                      gender: genderController.text,
                      medicalHistory: [],
                      phoneNum: phoneNumberController.text,
                    );
                    return PatientHomeScreen(
                      userModel: user,
                    );
                  }));
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
        });
      }
    } catch (e) {
      log("Image selection error: $e");
    }
  }

  // Future _cropImage(File? image) async {
  //   CroppedFile? croppedFile = await ImageCropper().cropImage(
  //     sourcePath: image!.path,
  //     uiSettings: [
  //       AndroidUiSettings(toolbarColor: Colors.red),
  //     ],
  //   );
  //   File? croppedImage = File(croppedFile!.path);
  //   return croppedImage;
  // }
}
