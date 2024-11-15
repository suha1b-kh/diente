import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diente/student/data/models/report_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore db = FirebaseFirestore.instance;

Future<void> addReport(ReportModel report) async {
  // Ensure the user is authenticated
  if (auth.currentUser == null) {
    log('User is not authenticated');
    return;
  }

  // Fetch the student's document
  DocumentSnapshot studentDoc =
      await db.collection('students').doc(auth.currentUser!.uid).get();

  // Check if the document exists
  if (!studentDoc.exists) {
    log('Student document does not exist for UID: ${auth.currentUser!.uid}');
    return;
  }

  // Check the case status
  if ((studentDoc.data() as Map<String, dynamic>?)?['caseStatus'] ==
      'finished') {
    log('Case status is finished. Report will not be added.');
    return;
  }

  try {
    // Retrieve the data as a map
    Map<String, dynamic>? studentData =
        studentDoc.data() as Map<String, dynamic>?;

    // Check if the reports field exists; if not, initialize it
    if (studentData != null && !studentData.containsKey('reports')) {
      log('Reports field does not exist. Initializing it as an empty array.');
      await db
          .collection('students')
          .doc(auth.currentUser!.uid)
          .update({'reports': []});
    }

    // Create the report map to add
    final reportData = {
      'reportId': report.reportId,
      'reportPic': report.reportPic,
      'caseName': report.caseName,
    };

    // Add the report to the reports array
    await db.collection('students').doc(auth.currentUser!.uid).update({
      'reports': FieldValue.arrayUnion([reportData])
    });

    log('Report added successfully: $reportData');
  } on FirebaseException catch (e) {
    log('Error adding report: $e');
  }
}

//fetch all reports
Future<List<ReportModel>> fetchAllReports(String id) async {
  List<ReportModel> reportsList = [];
  try {
    DocumentSnapshot studentDoc = await db.collection('students').doc(id).get();
    if (studentDoc.exists) {
      List<dynamic> reports = studentDoc['reports'];
      for (var report in reports) {
        reportsList.add(ReportModel.fromJson(report as Map<String, dynamic>));
      }
      log(reportsList.toString());
    } else {
      log("No reports found for the current user.");
    }
  } catch (e) {
    log("Error fetching reports: $e");
  }
  return reportsList;
}
