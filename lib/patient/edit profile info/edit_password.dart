// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:developer';

import 'package:diente/auth/presentation/login_screen.dart';
import 'package:diente/core/widgets/buttons.dart';
import 'package:diente/patient/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class EditPassword extends StatefulWidget {
  const EditPassword({super.key});

  @override
  State<EditPassword> createState() => _EditPasswordState();
}

class _EditPasswordState extends State<EditPassword> {
  final TextEditingController newSpasswordController = TextEditingController();

  final TextEditingController newpasswordController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

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
          'Edit Password',
        ),
      ),
      body: ListView(
        children: [
          Gap(80.h),
          CustomTextField(
            controller: passwordController,
            hint: 'يرجى ادخال كلمة المرور الحالية',
            textAlign: TextAlign.start,
            inputType: TextInputType.emailAddress,
            obscureText: false,
          ),
          Gap(30.h),
          CustomTextField(
            controller: newpasswordController,
            hint: 'يرجى ادخال كلمة المرور الجديدة',
            textAlign: TextAlign.start,
            inputType: TextInputType.visiblePassword,
            obscureText: false,
          ),
          Gap(30.h),
          CustomTextField(
            controller: newSpasswordController,
            hint: 'يرجى اعادة ادخال كلمة المرور الجديدة',
            textAlign: TextAlign.start,
            inputType: TextInputType.visiblePassword,
            obscureText: false,
          ),
          customButton(
            context,
            Theme.of(context).colorScheme.secondary,
            () async {
              if (newSpasswordController.text != newpasswordController.text) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'كلمة المرور غير متطابقة',
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.red,
                  ),
                );
              } else {
                String email = FirebaseAuth.instance.currentUser!.email!;
                final user = FirebaseAuth.instance.currentUser;
                final cred = EmailAuthProvider.credential(
                    email: email, password: passwordController.text);

                user!.reauthenticateWithCredential(cred).then((value) {
                  user.updatePassword(newpasswordController.text).then((_) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text(
                          'تم تحديث كلمة المرور بنجاح',
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                      ),
                    );
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                    );
                  }).catchError((error) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'حدث خطأ أثناء تحديث كلمة المرور. حاول مرة اخرى.',
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.red,
                      ),
                    );
                  });
                }).catchError((err) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'كلمة المرور الحالية غير صحيحة',
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.red,
                    ),
                  );
                });
              }
            },
            'ارسال',
            24.sp,
          ),
        ],
      ),
    );
  }
}
