import 'package:diente/core/widgets/buttons.dart';
import 'package:diente/core/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:pinput/pinput.dart';

class EmailVerificationScreen extends StatelessWidget {
  const EmailVerificationScreen({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
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

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          children: [
            customText(context, 'Check your Email',
                Theme.of(context).colorScheme.primary, 20.sp, FontWeight.w600),
            Gap(40.h),
            customText(context, 'Code has been sent to\nDiente@gmail.com',
                Theme.of(context).colorScheme.primary, 14.sp, FontWeight.w400),
            Gap(47.h),
            //pin input text field
            Pinput(
              length: 6,
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: focusedPinTheme,
              pinAnimationType: PinAnimationType.fade,
              onCompleted: (pin) {
                // TODO: verify code
                print("Verification Code: $pin");
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
            Gap(25.h),
            customButton(context, Theme.of(context).colorScheme.secondary,
                onTap, 'Verify', 16.sp),
          ],
        ),
      ),
    );
  }
}
