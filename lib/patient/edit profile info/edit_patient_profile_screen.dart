// ignore_for_file: must_be_immutable

import 'package:diente/auth/data/models/user.dart';
import 'package:diente/auth/data/source/auth_firebase_service.dart';
import 'package:diente/auth/presentation/medical_history_screen.dart';
import 'package:diente/patient/edit%20profile%20info/edit_email.dart';
import 'package:diente/patient/edit%20profile%20info/edit_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/patient_image_and_name.dart';

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
              patientImage: widget.patientImage),
          Gap(100.h),
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
}
