import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../appointment booking/disease_selection_screen.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_header.dart';

class PatientHomeScreen extends StatelessWidget {
  String patientName = "";
  ImageProvider? patientImage;

  //constructor
  PatientHomeScreen(
      {super.key, required this.patientName, required this.patientImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: ListView(
        children: [
          //Header
          CustomHeader(patientName: patientName, patientImage: patientImage),
          SizedBox(
            height: 101.h,
            width: 375.w,
          ),
          //Logo
          SizedBox(
              width: 214.28.w,
              height: 96.79.h,
              child: const Image(
                image: AssetImage("assets/images/logo2.png"),
                fit: BoxFit.contain,
              )),
          SizedBox(
            height: 3.h,
          ),
          Center(
              child: Text(
            "best place for free dental treatment",
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontSize: 13.sp,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
          )),
          SizedBox(
            height: 175.h,
            width: 375.w,
          ),

          //Appointment booking button
          CustomButton(
            width: 342.w,
            height: 55.h,
            borderRadius: 50.r,
            color: Theme.of(context).colorScheme.secondary,
            fontColor: Theme.of(context).colorScheme.surface,
            borderColor: Theme.of(context).colorScheme.secondary,
            text: "حجز موعد جديد",
            onTap: () {
              //TODO: navigate to disease selection screen
              Navigator.pushNamed(context, 'disease_selection_screen');
            },
          ),

          //view case information button
          CustomButton(
            width: 342.w,
            height: 55.h,
            borderRadius: 50.r,
            color: Theme.of(context).colorScheme.surface,
            fontColor: Theme.of(context).colorScheme.secondary,
            borderColor: Theme.of(context).colorScheme.secondary,
            text: "مراجعة معلومات الحالة",
            onTap: () {
              Navigator.pushNamed(context, 'no_cases_screen');
            },
          ),
        ],
      ),
    );
  }
}
