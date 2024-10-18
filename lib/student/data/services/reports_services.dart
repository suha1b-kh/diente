import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diente/student/data/models/report_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore db = FirebaseFirestore.instance;

Future<void> addReport(ReportModel report) async {
  DocumentSnapshot studentDoc =
      await db.collection('students').doc(auth.currentUser!.uid).get();

  if (studentDoc['caseStatus'] == 'finished') {
    return;
  }

  try {
    await db.collection('students').doc(auth.currentUser!.uid).update({
      'reports': FieldValue.arrayUnion([report.toJson()])
    });
    log('report added');
  } on FirebaseException catch (e) {
    log('error $e');
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
