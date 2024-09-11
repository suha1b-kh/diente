// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          SizedBox(
            height: 23.h,
          ),
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
                  onTap: () {})),
          SizedBox(
            height: 100.h,
          ),
          //Text field to enter the old password
          CustomTextField(
              hint: "كلمة السر القديمة",
              textAlign: TextAlign.start,
              inputType: TextInputType.text,
              obscureText: widget.obscureText,
              icon: IconButton(
                icon: widget.obscureText
                    ? const Icon(Icons.visibility_outlined)
                    : const Icon(Icons.visibility_off_outlined),
                color: Theme.of(context).colorScheme.inversePrimary,
                onPressed: () {},
              )),
          //Text field to enter the new password
          CustomTextField(
              hint: "كلمة السر الجديدة",
              textAlign: TextAlign.start,
              inputType: TextInputType.text,
              obscureText: widget.obscureText,
              icon: IconButton(
                icon: widget.obscureText
                    ? const Icon(Icons.visibility_outlined)
                    : const Icon(Icons.visibility_off_outlined),
                color: Theme.of(context).colorScheme.inversePrimary,
                onPressed: () {},
              )),
          //Text field to confirm password
          CustomTextField(
              hint: "تأكيد كلمة السر",
              textAlign: TextAlign.start,
              inputType: TextInputType.text,
              obscureText: widget.obscureText,
              icon: IconButton(
                icon: widget.obscureText
                    ? const Icon(Icons.visibility_outlined)
                    : const Icon(Icons.visibility_off_outlined),
                color: Theme.of(context).colorScheme.inversePrimary,
                onPressed: () {},
              )),
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
                  text: "تحديث المعلومات",
                  fontColor: Colors.white,
                  onTap: () {})),
        ],
      ),
    );
  }
}
