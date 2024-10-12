import 'package:diente/core/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../core/widgets/text_fields.dart';

class EditProfile extends StatelessWidget {
  EditProfile({
    super.key,
  });
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 2.h),
            width: 145.w,
            height: 145.h,
            //Todo fetch student image from firestore
            child: ClipOval(
                child: Image.asset(
              'assets/images/stu_img.png',
              width: 145.w,
              height: 145.h,
              fit: BoxFit.cover,
            )),
          ),
          customText(
            context,
            'Diente student',
            Theme.of(context).colorScheme.primary,
            16.sp,
            FontWeight.w500,
          ),
          Gap(15.h),
          Center(
            child: CustomTextField(
              width: 343.w,
              height: 56.h,
              controller: phoneNumberController,
              text: 'Phone number',
              keyboardType: TextInputType.number,
            ),
          ),
          Gap(15.h),
          CustomTextField(
            width: 343.w,
            height: 56.h,
            controller: passwordController,
            text: 'password',
            icon: Icons.visibility,
          ),
          Gap(15.h),
          CustomTextField(
            width: 343.w,
            height: 56.h,
            controller: newPasswordController,
            text: 'new password',
          ),
          Gap(15.h),
          CustomTextField(
            width: 343.w,
            height: 56.h,
            controller: confirmPasswordController,
            text: 'Confirm Password',
            icon: Icons.visibility,
          ),
        ],
      ),
    );
  }
}
