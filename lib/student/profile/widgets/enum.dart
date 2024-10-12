import 'dart:developer';

import 'package:diente/auth/data/models/user.dart';
import 'package:diente/student/data/models/case.dart';
import 'package:diente/student/data/models/student.dart';
import 'package:diente/student/data/services/database_services.dart';
import 'package:diente/student/data/services/students_services.dart';
import 'package:diente/student/profile/widgets/patient_widget.dart';
import 'package:diente/student/profile/widgets/treatment_widget.dart';
import 'package:diente/student/profile/widgets/student_profile_widget.dart';
import 'package:flutter/material.dart';

enum WidgetType { treatment, studentProfile, patient }

class ListWidgets extends StatelessWidget {
  final WidgetType widgetType;

  const ListWidgets({super.key, required this.widgetType});

  @override
  Widget build(BuildContext context) {
    Future<List<dynamic>> fetchData() {
      switch (widgetType) {
        case WidgetType.treatment:
          return DatabaseServices().getTreatmentList('someUid');
        case WidgetType.studentProfile:
          return fetchAllStudents();
        case WidgetType.patient:
          return DatabaseServices().getAllAcceptedRequests();
        default:
          return Future.value([]);
      }
    }

    return FutureBuilder<List<dynamic>>(
      future: fetchData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No data found'));
        } else {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              //treatment list
              if (widgetType == WidgetType.treatment) {
                final treatment = snapshot.data![index] as CaseModel;
                return TreatmentWidget(
                  patientName: 'Null',
                );
                //students list
              } else if (widgetType == WidgetType.studentProfile) {
                final student = snapshot.data![index] as StudentModel;

                return StudentProfileWidget(
                  studentName: student.name,
                  studentYear: student.year,
                  phone: student.phone,
                  profilePic: student.profilePic,
                );
                //patients list
              } else if (widgetType == WidgetType.patient) {
                final caseModel = snapshot.data![index] as CaseModel;
                return FutureBuilder<UserModel?>(
                  future: DatabaseServices().getPatient(caseModel.patientId!),
                  builder: (context, userSnapshot) {
                    if (userSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (userSnapshot.hasError) {
                      return Center(
                          child: Text('Error: ${userSnapshot.error}'));
                    } else if (!userSnapshot.hasData) {
                      return const Center(child: Text('Patient not found'));
                    } else {
                      List<CaseModel> acceptedReq =
                          snapshot.data as List<CaseModel>;
                      UserModel user = userSnapshot.data!;
                      return PatientWidget(
                        patientName: '${user.firstName} ${user.secondName}',
                        caseName: acceptedReq[index].caseDescription?['Name'],
                        toothNum:
                            acceptedReq[index].caseDescription?['toothNumber'],
                        uid: acceptedReq[index].patientId!,
                        caseId: acceptedReq[index].patientId!,
                        profilePic: user.profilePic,
                      );
                    }
                  },
                );
              }
              return const SizedBox.shrink();
            },
          );
        }
      },
    );
  }
}
