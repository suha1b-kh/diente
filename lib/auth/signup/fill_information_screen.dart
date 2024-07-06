import 'dart:developer';

import 'package:diente/core/widgets/buttons.dart';
import 'package:diente/core/widgets/drop_down_menu.dart';
import 'package:diente/core/widgets/text.dart';
import 'package:diente/core/widgets/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:pinput/pinput.dart';

class FillProfileScreen extends StatelessWidget {
  const FillProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //pinput theme (email verification code input)
    final defaultPinTheme = PinTheme(
      width: 56.w,
      height: 56.h,
      textStyle: TextStyle(
        fontSize: 20,
        color: Theme.of(context).colorScheme.primary,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.inverseSurface,
        border: Border.all(color: Theme.of(context).colorScheme.inverseSurface),
        borderRadius: BorderRadius.circular(8),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.secondary),
        borderRadius: BorderRadius.circular(8),
      ),
    );

    //controllers
    TextEditingController fullnameController = TextEditingController();
    TextEditingController nationalIDController = TextEditingController();
    TextEditingController ageController = TextEditingController();
    String? genderSelect;
    TextEditingController phoneNumberController = TextEditingController();

    String? selectedGender;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: customText(context, 'Fill Profile',
            Theme.of(context).colorScheme.primary, 14.sp, FontWeight.bold),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Center(
          child: ListView(
            children: [
              Gap(44.h),
              GestureDetector(
                child: Image.asset(
                  width: 122.w,
                  height: 122.h,
                  //TODO: Fetch photo from firebase if there is no photo set default
                  'assets/images/profile_photo.png',
                ),
                onTap: () {
                  //TODO: pick photo and store in firebase
                },
              ),
              Gap(26.h),
              CustomTextField(
                controller: fullnameController,
                text: 'Full name',
                width: 343.w,
                height: 56.h,
              ),
              Gap(10.h),
              CustomTextField(
                controller: nationalIDController,
                text: 'National ID',
                width: 343.w,
                height: 56.h,
              ),
              Gap(10.h),
              CustomTextField(
                controller: ageController,
                text: 'Age',
                width: 343.w,
                height: 56.h,
              ),
              Gap(10.h),
              CustomDropDownMenu(
                width: 343.w,
                height: 56.h,
                text: 'Gender',
                // icon: Icons.arrow_drop_down,
                items: const ['Male', 'Female'],

                selectedItem: selectedGender,
                onChanged: (String? newValue) {
                  genderSelect = newValue;
                },
              ),
              Gap(10.h),
              CustomTextField(
                controller: phoneNumberController,
                text: 'Phone number',
                width: 343.w,
                height: 56.h,
              ),
              Gap(94.h),
              customButton(
                context,
                Theme.of(context).colorScheme.secondary,
                () {
                  //TODO: send verification code
                  //TODO: send data in this screen to firebase
                  log('Send verification code to email');
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return showEnterPinDialog(
                          context, defaultPinTheme, focusedPinTheme);
                    },
                  );
                },
                'Continue',
                16.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Center showEnterPinDialog(BuildContext context, PinTheme defaultPinTheme,
      PinTheme focusedPinTheme) {
    return Center(
      child: AlertDialog(
        title: Center(
          child: customText(context, 'Check your Email',
              Theme.of(context).colorScheme.primary, 20.sp, FontWeight.w600),
        ),
        content: SingleChildScrollView(
          child: Column(
            children: [
              customText(
                  context,
                  //TODO: handle email
                  'Code has been sent to\nDiente@gmail.com',
                  Theme.of(context).colorScheme.primary,
                  14.sp,
                  FontWeight.w400),
              Gap(47.h),
              //pin input text field
              Pinput(
                length: 6,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                pinAnimationType: PinAnimationType.fade,
                onCompleted: (pin) {
                  print("Verification Code: $pin");
                  Navigator.pop(context);
                  //TODO: if pin correct show this dialog else show error
                  if (pin == '123456') {
                    showConfirmDialog(context);
                  } else {
                    showFailDialog(context);
                  }
                },
              ),
              Gap(25.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customText(
                      context,
                      'Didn\'t received code?',
                      Theme.of(context).colorScheme.primary,
                      14.sp,
                      FontWeight.w400),
                  customText(
                      context,
                      ' Resend',
                      Theme.of(context).colorScheme.secondary,
                      14.sp,
                      FontWeight.w400),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> showConfirmDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Center(
            child: AlertDialog(
              title: Column(
                children: [
                  customText(
                      context,
                      'Congratulations',
                      Theme.of(context).colorScheme.primary,
                      20.sp,
                      FontWeight.w600),
                  Gap(10.h),
                  customText(
                      context,
                      'Your Account is ready to use. you will\nbe directed to the Medical history\nform in a few seconds...',
                      Theme.of(context).colorScheme.primary,
                      14.sp,
                      FontWeight.w400),
                ],
              ),
              icon: Icon(
                size: 100.sp,
                Icons.shield_outlined,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          );
        });
  }

  Future<dynamic> showFailDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Center(
            child: AlertDialog(
              title: Column(
                children: [
                  customText(
                      context,
                      'Error',
                      Theme.of(context).colorScheme.primary,
                      20.sp,
                      FontWeight.w600),
                  Gap(10.h),
                  customText(
                      context,
                      'Not correct pin',
                      Theme.of(context).colorScheme.primary,
                      14.sp,
                      FontWeight.w400),
                ],
              ),
              icon: Icon(
                size: 100.sp,
                Icons.shield_outlined,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          );
        });
  }
}
