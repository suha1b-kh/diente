import 'dart:developer';

import 'package:diente/auth/data/models/user.dart';
import 'package:diente/student/data/services/choose_case.dart';
import 'package:diente/student/data/services/database_services.dart';
import 'package:diente/student/profile/screens/view_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

// ignore: must_be_immutable
class PatientWidget extends StatelessWidget {
  PatientWidget({
    super.key,
    required this.patientName,
    required this.caseName,
    required this.toothNum,
    required this.uid,
    required this.caseId,
    required this.profilePic,
  });
  String patientName;
  String caseName;
  String toothNum;
  String uid;
  String caseId;
  String profilePic;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 18.w),
      child: Container(
        width: 335.w,
        height: 120.h,
        decoration: ShapeDecoration(
          color: const Color(0xFFF2F4F7),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 15.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 30.r,
                backgroundImage: NetworkImage(profilePic),
              ),
              Gap(36.w),
              SizedBox(
                width: 180.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      patientName.split(' ')[0],
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 16.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0.h,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          caseName,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 14.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            height: 0.h,
                          ),
                        ),
                        Text(
                          'tooth: $toothNum',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontSize: 14.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            height: 0.h,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              // Gap(70.w),

              FutureBuilder<UserModel?>(
                future: DatabaseServices().getPatient(uid),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData) {
                    return const Center(child: Text('Patient not found'));
                  } else {
                    return IconButton(
                      icon: const Icon(Icons.arrow_forward_ios),
                      onPressed: () {
                        log(profilePic);
                        UserModel user = snapshot.data!;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ViewCase(
                              patientName: patientName,
                              caseName: caseName,
                              toothNum: toothNum,
                              phoneNum: user.phoneNum,
                              age: user.age,
                              medicalHistory: user.medicalHistory,
                              caseId: caseId,
                              profilePic: profilePic,
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
