import 'package:diente/auth/data/models/user.dart';
import 'package:diente/student/profile/screens/view_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ActiveWidget extends StatelessWidget {
  ActiveWidget(
      {super.key, required this.patient, required this.CaseDescription});
  UserModel patient;
  Map<String, dynamic> CaseDescription;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 15.w, horizontal: 18.w),
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
              padding: EdgeInsets.all(30.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${patient.firstName} ${patient.secondName}',
                    style: TextStyle(
                      color: const Color(0xFF1B2A57),
                      fontSize: 16.sp,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0.h,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward_ios),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ViewActiveCase(
                            patientName:
                                '${patient.firstName} ${patient.secondName}',
                            caseName: CaseDescription['Name'],
                            toothNum: CaseDescription['toothNumber'],
                            phoneNum: patient.phoneNum,
                            age: patient.age,
                            medicalHistory: patient.medicalHistory,
                            caseId: '',
                            profilePic: patient.profilePic,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
