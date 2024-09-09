import 'dart:developer';

import 'package:diente/auth/presentation/bloc/login_bloc/bloc/login_bloc.dart';
import 'package:diente/auth/presentation/bloc/login_bloc/bloc/login_event.dart';
import 'package:diente/auth/presentation/bloc/login_bloc/bloc/login_state.dart';
import 'package:diente/core/widgets/buttons.dart';
import 'package:diente/core/widgets/text.dart';
import 'package:diente/core/widgets/text_fields.dart';
import 'package:diente/patient/home/patient_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
              Navigator.popAndPushNamed(context, '/home_screen');
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
      body: BlocProvider(
        create: (context) => LoginBloc(),
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              try {
                log('Signup successful, navigating to the next screen');
                // Navigator.popAndPushNamed(context, 'patient_home_screen');
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return PatientHomeScreen(
                    patientName: 'state.user.fullName',
                  );
                }));
              } catch (e, stackTrace) {
                log('Navigation error: $e', error: e, stackTrace: stackTrace);
              }
            } else if (state is LoginFailure) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.error),
                backgroundColor: Colors.red,
              ));
            }
          },
          builder: (context, state) {
            if (state is LoginLoading) {
              if (state.isLoading == true) {
                return Center(child: Image.asset('assets/images/loading.gif'));
              } else {
                return bodyWidget(
                    emailController: emailController,
                    passwordController: passwordController);
              }
            }
            return bodyWidget(
                emailController: emailController,
                passwordController: passwordController);
          },
        ),
      ),
    );
  }
}

/// ***************** body widget *******************
class bodyWidget extends StatelessWidget {
  const bodyWidget({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: ListView(
        children: [
          customText(
            context,
            'Sign in to your \nAccount',
            Theme.of(context).colorScheme.primary,
            32.sp,
            FontWeight.bold,
          ),
          Gap(50.h),
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
          Gap(70.h),
          customButton(
            context,
            Theme.of(context).colorScheme.secondary,
            () {
              BlocProvider.of<LoginBloc>(context).add(
                SubmitLogin(
                  email: emailController.text,
                  password: passwordController.text,
                ),
              );
            },
            'Continue',
            16.sp,
          ),
          Gap(36.h),
          GestureDetector(
            onTap: () => Navigator.popAndPushNamed(
                context, '/create_new_password_screen'),
            child: Center(
              child: customText(
                context,
                'Forgot Password?',
                Theme.of(context).colorScheme.secondary,
                14.sp,
                FontWeight.w500,
              ),
            ),
          ),
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
                FontWeight.normal,
              ),
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
                  side: const BorderSide(
                    width: 1,
                    color: Color(0xFFD9D9D9),
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Center(
                child: Image.asset(
                  width: 50.w,
                  height: 50.h,
                  'assets/images/google.png',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
