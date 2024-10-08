import 'package:diente/auth/data/models/user.dart';
import 'package:diente/student/data/models/case.dart';
import 'package:diente/student/data/services/database_services.dart';
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
    return FutureBuilder(
        future: DatabaseServices().getAllAcceptedRequests(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No cases found'));
          } else {
            List<CaseModel> acceptedReq = snapshot.data!;
            return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: acceptedReq.length,
                itemBuilder: (context, index) {
                  if (widgetType == WidgetType.treatment) {
                    return TreatmentWidget(
                      patientName: 'patient $index',
                    );
                  } else if (widgetType == WidgetType.studentProfile) {
                    return StudentProfileWidget(
                      studentName: 'Student $index',
                      studentYear: '3',
                    );
                  } else if (widgetType == WidgetType.patient) {
                    return FutureBuilder<UserModel?>(
                      future: DatabaseServices()
                          .getPatient(acceptedReq[index].patientId!),
                      builder: (context, userSnapshot) {
                        if (userSnapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (userSnapshot.hasError) {
                          return Center(
                              child: Text('Error: ${userSnapshot.error}'));
                        } else if (!userSnapshot.hasData) {
                          return const Center(child: Text('Patient not found'));
                        } else {
                          UserModel user = userSnapshot.data!;
                          return PatientWidget(
                              patientName:
                                  '${user.firstName} ${user.secondName}',
                              caseName:
                                  acceptedReq[index].caseDescription?['Name'],
                              toothNum: acceptedReq[index]
                                  .caseDescription?['toothNumber'],
                              uid: acceptedReq[index].patientId!);
                        }
                      },
                    );
                  }
                  return null;
                });
          }
        });
  }
}
