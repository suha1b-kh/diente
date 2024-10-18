import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diente/auth/data/models/user.dart';
import 'package:diente/student/data/models/case.dart';
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
        if (snapshot.hasData) {
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
                  return reportsWidget(
                    caseName:
                        user.firstName, 
                    reportName: caseModel.caseDescription!['Name'],
                    CaseDescription: caseModel.caseDescription!['toothNumber'],
                  );
                },
              );
            },
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
