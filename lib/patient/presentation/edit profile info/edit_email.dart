import 'dart:async';
import 'dart:developer';
import 'package:diente/auth/presentation/login_screen.dart';
import 'package:diente/core/widgets/buttons.dart';
import 'package:diente/patient/presentation/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class EditEmail extends StatefulWidget {
  const EditEmail({super.key});

  @override
  State<EditEmail> createState() => _EditEmailState();
}

class _EditEmailState extends State<EditEmail> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Edit Email',
        ),
      ),
      body: ListView(
        children: [
          Gap(80.h),
          CustomTextField(
            controller: emailController,
            hint: 'يرجى ادخال البريد الالكتروني الجديد',
            textAlign: TextAlign.start,
            inputType: TextInputType.emailAddress,
            obscureText: false,
          ),
          Gap(30.h),
          customButton(
            context,
            Theme.of(context).colorScheme.secondary,
            () async {
              FirebaseAuth auth = FirebaseAuth.instance;
              try {
                auth.currentUser!.verifyBeforeUpdateEmail(emailController.text);
              } on Exception catch (e) {
                log(e.toString());
              }
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('تم ارسال بريد تحقق'),
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                ),
              );
              Timer(const Duration(seconds: 5), () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (route) => false,
                );
              });
            },
            'ارسال',
            24.sp,
          ),
        ],
      ),
    );
  }
}
