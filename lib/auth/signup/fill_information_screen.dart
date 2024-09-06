import 'package:diente/auth/signup/email_verification_screen.dart';
import 'package:diente/auth/signup/medical_history_screen.dart';
import 'package:diente/core/widgets/buttons.dart';
import 'package:diente/core/widgets/drop_down_menu.dart';
import 'package:diente/core/widgets/text.dart';
import 'package:diente/core/widgets/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class FillProfileScreen extends StatelessWidget {
  const FillProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController fullnameController = TextEditingController();
    TextEditingController nationalIDController = TextEditingController();
    TextEditingController ageController = TextEditingController();
    TextEditingController genderController = TextEditingController();
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
                    'assets/images/profile_photo.png'),
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
                onChanged: (String? newValue) {},
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
                  Navigator.popAndPushNamed(
                      context, '/fill_medical_history_screen');
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
