import 'package:diente/core/widgets/buttons.dart';
import 'package:diente/core/widgets/text.dart';
import 'package:diente/core/widgets/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamed(context, '/login_screen');
            //TODO: Implement back button
          },
        ),
        title: customText(context, 'Create new password',
            Theme.of(context).colorScheme.primary, 14.sp, FontWeight.bold),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Gap(93.h),
          customText(context, 'Create Your New Password',
              Theme.of(context).colorScheme.primary, 16.sp, FontWeight.w500),
          Gap(29.h),
          CustomTextField(
            width: 343.w,
            height: 56.h,
            controller: passwordController,
            text: 'Enter your password',
            icon: Icons.visibility,
          ),
          Gap(16.h),
          CustomTextField(
            width: 343.w,
            height: 56.h,
            controller: confirmPasswordController,
            text: 'Confirm password',
            icon: Icons.visibility,
          ),
          Gap(350.h),
          customButton(context, Theme.of(context).colorScheme.secondary, () {
            Navigator.popAndPushNamed(context, '/fill_profile_screen');
          }, 'Continue', 16.sp),
        ],
      ),
    );
  }
}
