import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TreatmentWidget extends StatelessWidget {
  TreatmentWidget({super.key, required this.patientName});
  String patientName;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 18),
          child: Container(
            width: 335.w,
            height: 120.h,
            decoration: ShapeDecoration(
              color: const Color(0xFFF2F4F7),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 65.w,
                  height: 65.h,
                  child: Image.asset(
                    'assets/images/profile_photo.png',
                  ),
                ),
                Center(
                  child: Text(
                    patientName,
                    style: TextStyle(
                      color: const Color(0xFF1B2A57),
                      fontSize: 16.sp,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0.h,
                    ),
                  ),
                ),
                  Padding(
                  padding: EdgeInsets.only(left: 230.dm),
                  child: const Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
