import 'dart:developer';
import 'package:diente/auth/data/models/user.dart';
import 'package:diente/student/data/models/case.dart';
import 'package:diente/student/data/models/student.dart';
import 'package:diente/student/data/services/database_services.dart';
import 'package:diente/student/data/services/students_services.dart';
import 'package:diente/student/profile/widgets/patient_widget.dart';
import 'package:diente/student/profile/widgets/active.dart';
import 'package:diente/student/profile/widgets/student_profile_widget.dart';
import 'package:flutter/material.dart';
import '../../data/services/cases_filter.dart';


enum WidgetType { active, studentProfile, patient }

//list of widgets
class ListWidgets extends StatelessWidget {
  final WidgetType widgetType;
  dynamic diseaseName;
  dynamic gender ;
  dynamic maxAge;
  dynamic minAge;
  dynamic toothNumber;
   ListWidgets({super.key, required this.widgetType,this.diseaseName,this.gender,this.maxAge,this.minAge,this.toothNumber});

  @override
  Widget build(BuildContext context) {
    Future<List<dynamic>>? fetchData() {
      switch (widgetType) {
        case WidgetType.active:
          return DatabaseServices().getActiveCases(); //TODO: get uid
        case WidgetType.studentProfile:
          return fetchAllStudents();
        case WidgetType.patient:
          return Filter().filterData(diseaseName:diseaseName ,gender:gender ,maxAge:maxAge ,minAge:minAge ,toothNumber:toothNumber );
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
              //active case list
              if (widgetType == WidgetType.active) {
                return FutureBuilder<UserModel?>(
                  future: DatabaseServices()
                      .getPatient(snapshot.data![index].patientId!),
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
                      UserModel user = userSnapshot.data!;
                      return ActiveWidget(
                        patient: user,
                        CaseDescription: snapshot.data![index].caseDescription,
                      );
                    }
                  },
                );
                //students list
              } else if (widgetType == WidgetType.studentProfile) {
                final student = snapshot.data![index] as StudentModel;

                return StudentProfileWidget(
                  stdModel: student,
                  // studentName: student.name,
                  // studentYear: student.year,
                  // phone: student.phone,
                  // profilePic: student.profilePic,
                );
                //patients list
              } else if (widgetType == WidgetType.patient)
              {
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
