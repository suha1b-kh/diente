import 'package:diente/core/widgets/buttons.dart';
import 'package:diente/core/widgets/text.dart';
import 'package:diente/core/widgets/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();

    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/login_screen');
                },
                child: customText(
                    context,
                    'Login',
                    Theme.of(context).colorScheme.secondary,
                    14.sp,
                    FontWeight.normal),
              ),
            ),
          ]),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: ListView(
          children: [
            customText(context, 'Create your \nAccount',
                Theme.of(context).colorScheme.primary, 32.sp, FontWeight.bold),
            Gap(77.h),
            CustomTextField(
              width: 343.w,
              height: 56.h,
              controller: emailController,
              text: 'Enter your email',
            ),
            Gap(16.h),
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
            Gap(124.h),
            customButton(context, Theme.of(context).colorScheme.secondary, () {
              Navigator.pushNamed(context, '/fill_profile_screen');
            }, 'Continue', 16.sp),
            Gap(24.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100.w,
                  height: 1,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                customText(
                    context,
                    '  Or continue with  ',
                    Theme.of(context).colorScheme.primary,
                    14.sp,
                    FontWeight.normal),
                Container(
                  width: 100.w,
                  height: 1,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ],
            ),
            Gap(24.h),
            Center(
              child: Container(
                width: 77.w,
                height: 52.h,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Color(0xFFD9D9D9)),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Center(
                    child: Image.asset(
                        width: 50.w, height: 50.h, 'assets/images/google.png')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
