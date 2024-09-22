// ignore_for_file: must_be_immutable

import 'package:diente/auth/data/models/user.dart';
import 'package:diente/auth/presentation/medical_history_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/custom_button.dart';
import '../widgets/patient_image_and_name.dart';

class CaseInformationScreen extends StatefulWidget {
  final UserModel user;

  Color getColor(String status) {
    //TODO: return color based on case status
    if (status == "Active") {
      return const Color(0xFF11C72E);
    } else if (status == "Waiting") {
      return const Color(0xFFFBBC05);
    } else if (status == "Finished") {
      return Colors.blue;
    } else {
      return Colors.red;
    }
  }

  //constructor
  const CaseInformationScreen({super.key, required this.user});

  @override
  State<CaseInformationScreen> createState() => _CaseInformationScreenState();
}

class _CaseInformationScreenState extends State<CaseInformationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          //notification button
          Container(
              height: 50.h,
              width: 50.w,
              margin: EdgeInsets.only(top: 17.h, right: 8.w),
              alignment: Alignment.topRight,
              child: IconButton(
                alignment: Alignment.topRight,
                onPressed: () {},
                icon: Icon(
                  Icons.notifications,
                  size: 27.sp,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              )),
          //patient image and name
          PatientImageAndName(
              patientName: "${widget.user.firstName} ${widget.user.secondName}",
              patientImage: NetworkImage(widget.user.profilePic)),
          SizedBox(
            height: 31.h,
          ),
          //disease name
          Center(
            child: SizedBox(
              width: 346.w,
              height: 70.h,
              //TODO: display disease name
              child: Text('widget.disease',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w700,
                  )),
            ),
          ),
          SizedBox(
            height: 17.h,
          ),
          //Case Status
          Center(
            child: SizedBox(
              width: 168.w,
              height: 30.h,
              child: Text(
                //TODO: case status
                'widget.caseStatus',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: widget.getColor('Active'),
                  fontSize: 21.sp,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 177,
          ),
          //Review patient history button
          CustomButton(
            width: 342.w,
            height: 55.h,
            borderRadius: 50.r,
            color: Theme.of(context).colorScheme.secondary,
            fontColor: Colors.white,
            borderColor: Theme.of(context).colorScheme.secondary,
            text: "مراجعة السجل المرضي",
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return MedicalHistoryScreen(user: widget.user);
              }));
            },
          ),
          SizedBox(
            height: 5.h,
          ),
          //remove case button
          CustomButton(
            width: 342.w,
            height: 55.h,
            borderRadius: 50.r,
            color: const Color(0xFFEF0107),
            fontColor: Colors.white,
            borderColor: const Color(0xFFEF0107),
            text: "الغاء الموعد",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
