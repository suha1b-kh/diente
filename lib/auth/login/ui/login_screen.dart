import 'package:diente/core/widgets/buttons.dart';
import 'package:diente/core/widgets/text.dart';
import 'package:diente/core/widgets/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

// ignore: must_be_immutable
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
      appBar: AppBar(automaticallyImplyLeading: false, actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/signup_screen');
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

      //body

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customText(context, 'Sign in to your \nAccount',
                Theme.of(context).colorScheme.primary, 32.sp, FontWeight.bold),
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
            Gap(50.h),
            customButton(
              context,
              Theme.of(context).colorScheme.secondary,
              () {
                //TODO: handle login
              },
              'Continue',
              16.sp,
            ),
            Gap(30.h),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/create_new_password_screen');
              },
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    //TODO: handle forgot password
                  },
                  child: customText(
                      context,
                      'Forgot Password?',
                      Theme.of(context).colorScheme.secondary,
                      14.sp,
                      FontWeight.w500),
                ),
              ),
            ),
            Gap(30.h),
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
                child: GestureDetector(
                  onTap: () {
                    //TODO: Login with google
                  },
                  child: Center(
                      child: Image.asset(
                          width: 50.w,
                          height: 50.h,
                          'assets/images/google.png')),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
