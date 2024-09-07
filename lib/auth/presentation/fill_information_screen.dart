import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:diente/core/widgets/buttons.dart';
import 'package:diente/core/widgets/drop_down_menu.dart';
import 'package:diente/core/widgets/text.dart';
import 'package:diente/core/widgets/text_fields.dart';

class FillProfileScreen extends StatelessWidget {
  const FillProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController fullnameController = TextEditingController();
    TextEditingController nationalIDController = TextEditingController();
    TextEditingController ageController = TextEditingController();
    TextEditingController genderController = TextEditingController();
    TextEditingController phoneNumberController = TextEditingController();

    List<Map<String, bool>> medicalHistory = [];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: customText(
          context,
          'Fill Profile',
          Theme.of(context).colorScheme.primary,
          14.sp,
          FontWeight.bold,
        ),
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
                  'assets/images/profile_photo.png',
                  width: 122.w,
                  height: 122.h,
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
                items: const ['Male', 'Female'],
                selectedItem: null,
                onChanged: (String? newValue) {
                  genderController.text = newValue ?? '';
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
                  // BlocProvider.of<ProfileBloc>(context).add(
                  //   SubmitProfile(
                  //     fullName: fullnameController.text,
                  //     nationalId: nationalIDController.text,
                  //     age: ageController.text,
                  //     gender: genderController.text,
                  //     phoneNumber: phoneNumberController.text,
                  //     medicalHistory: medicalHistory,
                  //   ),
                  // );
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
}
