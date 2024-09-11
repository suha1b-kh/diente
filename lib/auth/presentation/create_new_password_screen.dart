// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:diente/core/widgets/buttons.dart';
import 'package:diente/core/widgets/text.dart';
import 'package:diente/core/widgets/text_fields.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: customText(context, 'Reset Password',
            Theme.of(context).colorScheme.primary, 14.sp, FontWeight.bold),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Gap(93.h),
            customText(context, 'CLick on the button',
                Theme.of(context).colorScheme.primary, 16.sp, FontWeight.w500),
            customText(context, 'to send password reset email',
                Theme.of(context).colorScheme.primary, 16.sp, FontWeight.w500),
            Gap(50.h),
            CustomTextField(
              controller: emailController,
              text: 'Enter your email',
              width: 343.w,
              height: 56.h,
            ),
            Gap(250.h),
            customButton(context, Theme.of(context).colorScheme.secondary,
                () async {
              try {
                await FirebaseAuth.instance
                    .sendPasswordResetEmail(email: emailController.text);
                log(emailController.text);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    content: const Text(
                        "Reset password sent successfully. Please check your email"),
                  ),
                );
              } on FirebaseAuthException catch (e) {
                log("Error: $e");
              }
            }, 'Continue', 16.sp),
            Gap(10.h),
            customButton(context, Theme.of(context).colorScheme.secondary,
                () async {
              Navigator.pushNamed(context, '/login_screen');
            }, 'Back to login', 16.sp),
          ],
        ),
      ),
    );
  }
}
