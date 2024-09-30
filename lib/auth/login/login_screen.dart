import 'package:diente/core/widgets/buttons.dart';
import 'package:diente/core/widgets/text.dart';
import 'package:diente/core/widgets/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  String? email, password;

  bool passwordVisible = true, isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.popAndPushNamed(context, '/home_Screen');
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.popAndPushNamed(context, '/signup_screen');
                },
                child: customText(
                    context,
                    'Create Account',
                    Theme.of(context).colorScheme.secondary,
                    14.sp,
                    FontWeight.normal),
              ),
            ),
          ]),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              customText(
                  context,
                  'Sign in to your \nAccount',
                  Theme.of(context).colorScheme.primary,
                  32.sp,
                  FontWeight.bold),
              Gap(77.h),
              CustomTextField(
                width: 343.w,
                height: 56.h,
                controller: emailController,
                text: 'Enter your email',
              ),
              SizedBox(height: 16.h),
              CustomTextField(
                width: 343.w,
                height: 56.h,
                controller: passwordController,
                text: 'Enter your password',
                icon: Icons.visibility,
              ),
              SizedBox(height: 16.h),
              Gap(124.h),
              customButton(context, Theme.of(context).colorScheme.secondary,
                  () {}, 'Continue', 16.sp),
              Gap(36.h),
              GestureDetector(
                  onTap: () {
                    Navigator.popAndPushNamed(
                        context, '/create_new_password_screen');
                  },
                  child: customText(
                      context,
                      'Forgot Password?',
                      Theme.of(context).colorScheme.secondary,
                      14.sp,
                      FontWeight.w500)),
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
                      side:
                          const BorderSide(width: 1, color: Color(0xFFD9D9D9)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Center(
                      child: Image.asset(
                          width: 50.w,
                          height: 50.h,
                          'assets/images/google.png')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
