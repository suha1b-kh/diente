// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../auth/data/models/user.dart';
import '../../case_details.dart';
import '../Home/patient_home_screen.dart';
import '../appointment booking/disease_selection_screen.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_header.dart';


class NoCasesScreen extends StatefulWidget {
  /*String patientName = "";
  ImageProvider patientImage;*/
  UserModel userModel;

  //constructor
  NoCasesScreen({super.key, required this.userModel});

  @override
  State<NoCasesScreen> createState() => _NoCasesScreenState();
}

class _NoCasesScreenState extends State<NoCasesScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          // Navigate back to the home page when the back button is pressed
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (context) => PatientHomeScreen(
                        userModel: widget.userModel,
                      )),
              (Route route) => false);
          return false; // Returning false prevents the default back button behavior
        },
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          body: ListView(
            children: [
              //Header
              CustomHeader(
                  patientName:
                      '${widget.userModel.firstName} ${widget.userModel.secondName}',
                  patientImage:
                      const AssetImage('assets/images/patient.png')),
              SizedBox(height: 100.h),
              //no cases image
              SizedBox(
                  width: 203.w,
                  height: 203.h,
                  child: const Image(
                      image: AssetImage("assets/images/no_cases_image.png"))),
              SizedBox(height: 20.h),
              //no cases message
              SizedBox(
                width: 286.w,
                height: 135.h,
                child: Text(
                  'المعذرة!   لا يوجد موعد فعال',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 30.sp,
                    fontFamily: 'NotoSansArabic',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: 29.h),

              SizedBox(
                width: 364.w,
                height: 56.h,
                child: Text(
                  'يرجى حجز موعد جديد',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 16.sp,
                    fontFamily: 'NotoSansArabic',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 50.h),
              //button
              CustomButton(
                width: 342.w,
                height: 55.h,
                borderRadius: 50.r,
                color: Theme.of(context).colorScheme.secondary,
                fontColor: Colors.white,
                borderColor: Theme.of(context).colorScheme.secondary,
                text: "حجز موعد",
                onTap: () {
                  // Navigate to disease selection screen
                  PatientHomeScreen.caseDetails = CaseDetails();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            DiseaseSelectionScreen(
                          userModel: widget.userModel,
                          caseDetails: PatientHomeScreen.caseDetails!,
                        ),
                      ));
                },
              ),
            ],
          ),
        ));
  }
}
