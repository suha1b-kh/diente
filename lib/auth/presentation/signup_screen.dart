import 'dart:developer';

import 'package:diente/auth/presentation/bloc/bloc/signup_bloc.dart';
import 'package:diente/auth/presentation/bloc/bloc/signup_event.dart';
import 'package:diente/auth/presentation/bloc/bloc/signup_state.dart';

import 'package:diente/core/widgets/buttons.dart';
import 'package:diente/core/widgets/google.dart';
import 'package:diente/core/widgets/text.dart';
import 'package:diente/core/widgets/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool passwordVisible = true; // to show or hide password
  GlobalKey<FormState> formKey = GlobalKey(); //to validate form
  //text controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  //validate function
  String validateField(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/home_screen');
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.popAndPushNamed(context, '/login_screen');
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

      /********** body **********/

      body: BlocProvider<SignupBloc>(
        create: (context) => SignupBloc(), //bloc creation
        child:
            BlocConsumer<SignupBloc, SignupState>(listener: (context, state) {
          //if signup success => navigate to verify email screen
          if (state is SignupSuccess) {
            try {
              log('Signup successful, navigating to the next screen');
              Navigator.popAndPushNamed(context, '/email_verification_screen');
            } catch (e, stackTrace) {
              log('Navigation error: $e', error: e, stackTrace: stackTrace);
            }
            //if signup failure => show snackbar error
          } else if (state is SignupFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.error),
              backgroundColor: Colors.red,
            ));
          }
        }, builder: (context, state) {
          //if signup loading => show loading image ? else show signup form
          if (state is SignupLoading) {
            return Center(
              child: Image.asset('assets/images/loading.gif'),
            );
          } else {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Form(
                key: formKey,
                child: ListView(
                  children: [
                    customText(
                        context,
                        'Create your \nAccount',
                        Theme.of(context).colorScheme.primary,
                        32.sp,
                        FontWeight.bold),
                    Gap(77.h),
                    CustomTextField(
                      width: 343.w,
                      height: 56.h,
                      controller: emailController,
                      text: 'Enter your email',
                      validator: validateField,
                    ),
                    Gap(16.h),
                    CustomTextField(
                      width: 343.w,
                      height: 56.h,
                      controller: passwordController,
                      text: 'Enter your password',
                      icon: passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      hide: passwordVisible,
                      iconPressed: () {
                        setState(() {
                          passwordVisible = !passwordVisible;
                        });
                      },
                      validator: validateField,
                    ),
                    Gap(16.h),
                    CustomTextField(
                      width: 343.w,
                      height: 56.h,
                      controller: confirmPasswordController,
                      text: 'Confirm password',
                      icon: passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      hide: passwordVisible,
                      iconPressed: () {
                        //TODO:refactor
                        setState(() {
                          passwordVisible = !passwordVisible;
                        });
                      },
                      validator: validateField,
                    ),
                    Gap(90.h),
                    customButton(
                      context,
                      Theme.of(context).colorScheme.secondary,
                      () {
                        if (passwordController.text ==
                                confirmPasswordController.text &&
                            !formKey.currentState!.validate()) {
                          BlocProvider.of<SignupBloc>(context).add(
                            SubmitSignup(
                              email: emailController.text,
                              password: passwordController.text,
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('Passwords do not match'),
                            backgroundColor: Colors.red,
                          ));
                        }
                      },
                      'Continue',
                      16.sp,
                    ),
                    Gap(24.h),
                    //******************** Login with google**********************/
                    google(context),
                  ],
                ),
              ),
            );
          }
        }),
      ),
    );
  }
}
