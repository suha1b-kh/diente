import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_header.dart';

// ignore: must_be_immutable
class PatientHomeScreen extends StatelessWidget {
  String? patientName = "";
  ImageProvider? patientImage;

  //constructor
  PatientHomeScreen({super.key, this.patientName, this.patientImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
              child: const Image(image: AssetImage("assets/images/logo2.png"))),
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
            fontColor: Colors.white,
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
            color: Colors.white,
            fontColor: Theme.of(context).colorScheme.secondary,
            borderColor: Theme.of(context).colorScheme.secondary,
            text: "مراجعة معلومات الحالة",
            onTap: () {
              Navigator.pushNamed(context, 'no_cases_screen');
            },
          ),
          CustomButton(
            width: 342.w,
            height: 55.h,
            borderRadius: 50.r,
            color: Colors.red,
            fontColor: Colors.white,
            borderColor: Colors.red,
            text: "تسجيل الخروج",
            onTap: () async {
              log(FirebaseAuth.instance.currentUser!.email.toString());
              if (FirebaseAuth.instance.currentUser != null) {
                await FirebaseAuth.instance.signOut();
              }
              // ignore: use_build_context_synchronously
              Navigator.popAndPushNamed(context, '/login_screen');
            },
          ),
        ],
      ),
    );
  }
}
