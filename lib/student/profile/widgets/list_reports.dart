import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diente/auth/data/models/user.dart';
import 'package:diente/student/data/models/case.dart';
import 'package:diente/student/data/models/report_model.dart';
import 'package:diente/student/data/services/database_services.dart';
import 'package:flutter/material.dart';

import 'reports_widget.dart';

// ignore: camel_case_types
class listReportsView extends StatelessWidget {
  const listReportsView({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CaseModel>>(
      future: DatabaseServices().getfinishedCases(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Text('No cases found');
        }

        return GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: snapshot.data!.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            final CaseModel caseModel = snapshot.data![index];
            String uid = caseModel.patientId!;

            return FutureBuilder<UserModel>(
              future: DatabaseServices().getPatient(uid),
              builder: (context, userSnapshot) {
                if (userSnapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                if (userSnapshot.hasError) {
                  return Text('Error: ${userSnapshot.error}');
                }
                if (!userSnapshot.hasData) {
                  return const Text('User not found');
                }

                final user = userSnapshot.data!;
                return FutureBuilder<List<String>>(
                  future: DatabaseServices().getReportPics(uid),
                  builder: (context, reportSnapshot) {
                    if (reportSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    }
                    if (reportSnapshot.hasError) {
                      return Text('Error: ${reportSnapshot.error}');
                    }
                    if (!reportSnapshot.hasData ||
                        reportSnapshot.data!.isEmpty) {
                      return const Text('No reports found');
                    }

                    final reportpic = reportSnapshot.data!;
                    log('message: $reportpic');
                    return reportsWidget(
                      reportPic: reportpic[index],
                      caseName: user.firstName,
                      reportName: caseModel.caseDescription!['Name'],
                      CaseDescription:
                          caseModel.caseDescription!['toothNumber'],
                    );
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
