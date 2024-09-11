import 'dart:async';
import 'dart:developer';

import 'package:diente/auth/data/source/auth_firebase_service.dart';
import 'package:diente/core/widgets/buttons.dart';
import 'package:diente/core/widgets/text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:pinput/pinput.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  /// ******************************************

  bool isEmailVerified = false;
  Timer? timer;
  @override
  void initState() {
// TODO: implement initState
    super.initState();
    FirebaseAuth.instance.currentUser?.sendEmailVerification();
    timer =
        Timer.periodic(const Duration(seconds: 3), (_) => checkEmailVerified());
  }

  checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser?.reload();

    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (isEmailVerified) {
      Navigator.popAndPushNamed(context, 'patient_home_screen');
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Email Successfully Verified")));

      timer?.cancel();
    }
  }

  @override
  void dispose() {
// TODO: implement dispose
    timer?.cancel();
    super.dispose();
  }

  /// ******************************************
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(60.w),
        child: Center(
          child: Column(
            children: [
              customText(
                context,
                'Check your Email',
                Theme.of(context).colorScheme.primary,
                24.sp,
                FontWeight.bold,
              ),
              Gap(20.h),
              customText(
                context,
                'We have send a verification',
                Theme.of(context).colorScheme.secondary,
                16.sp,
                FontWeight.normal,
              ),
              customText(
                context,
                'link to your email',
                Theme.of(context).colorScheme.secondary,
                16.sp,
                FontWeight.normal,
              ),
              Gap(50.h),
              Image.asset('assets/images/email_check.gif'),
              Gap(50.h),
              customButton(
                context,
                Theme.of(context).colorScheme.secondary,
                () {},
                'Resend',
                16,
              )
            ],
          ),
        ),
      ),
    );
  }
}
