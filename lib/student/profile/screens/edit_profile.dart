import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../core/widgets/text_fields.dart';

class EditProfile extends StatelessWidget {
   EditProfile({super.key,dispo});
final TextEditingController phoneNumberController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextEditingController newPasswordController = TextEditingController();
final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold
     (body:  Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 100.h, bottom: 10.h),
          width: 145.w,
          height: 145.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(500.0.r)),
            image: const DecorationImage(
              //Todo fetch student image from firebase
              image: AssetImage('assets/images/profile_photo.png'),
            ),
          ),
        ),
        const Text(
          'Diente student',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF1B2A57),
            fontSize: 20,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        ),
        Gap(15.h),
        CustomTextField(
              width: 343.w,
              height: 56.h,
              controller: phoneNumberController,
              text: 'Phone number',
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
    )
    ,);
  }
}
