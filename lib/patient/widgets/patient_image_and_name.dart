import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PatientImageAndName extends StatefulWidget {
  String patientName = "";
  ImageProvider? patientImage;

  PatientImageAndName({
    super.key,
    required this.patientName,
    required this.patientImage,
  });

  @override
  State<PatientImageAndName> createState() => _PatientImageAndNameState();
}

class _PatientImageAndNameState extends State<PatientImageAndName> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //image
        Container(
          width: 145.w,
          height: 145.h,
          decoration: const ShapeDecoration(
            shape: OvalBorder(),
          ),
          child: Image(
            image: widget.patientImage!,
            fit: BoxFit.contain,
          ),
        ),
        //name
        Padding(
            padding: EdgeInsets.only(top: 17.h),
            child: Text(
              widget.patientName,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 18.sp,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            )),
      ],
    );
  }
}
