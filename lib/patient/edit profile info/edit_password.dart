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
              bool changed = false;
              FirebaseAuth auth = FirebaseAuth.instance;
              try {
                if (await auth.signInWithEmailAndPassword(
                        email: auth.currentUser!.email!,
                        password: passwordController.text) ==
                    true) {
                  if (newpasswordController.text ==
                      newSpasswordController.text) {
                    auth.currentUser!
                        .updatePassword(newpasswordController.text);
                    changed = true;
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.red,
                        content: Text('كلمة المرور الجديدة غير متطابقة'),
                      ),
                    );
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.red,
                      content: Text('كلمة المرور الحالية غير صحيحة'),
                    ),
                  );
                }
              } on Exception catch (e) {
                log(e.toString());
              }
              if (changed) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    content: const Text('تم تغيير كلمة المرور بنجاح'),
                  ),
                );
              }
              // Timer(const Duration(seconds: 5), () {
              //   Navigator.pushAndRemoveUntil(
              //     context,
              //     MaterialPageRoute(builder: (context) => const LoginScreen()),
              //     (route) => false,
              //   );
              // });
            },
            'ارسال',
            24.sp,
          ),
        ],
      ),
    );
  }
}
