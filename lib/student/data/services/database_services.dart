import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diente/auth/data/models/user.dart';
import 'package:diente/student/data/models/case.dart';
import 'package:diente/student/data/models/report_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class DatabaseServices {
  final acceptedRequestsCollection =
      FirebaseFirestore.instance.collection('acceptedRequests');

  final patentCollection = FirebaseFirestore.instance.collection("patients");

  final treatmentCollection =
      FirebaseFirestore.instance.collection('treatments');
  Future<List<CaseModel>> getAllAcceptedRequests() async {
    List<CaseModel> casesList = [];

    try {
      QuerySnapshot querySnapshot = await acceptedRequestsCollection
          .where("caseStatus", isEqualTo: "accepted")
          .get();
      for (var doc in querySnapshot.docs) {
        casesList
            .add(CaseModel.fromFirestore(doc.data() as Map<String, dynamic>));
      }
    } catch (e) {
      if (e is FirebaseException) {
        log("FirebaseException: ${e.message}");
      } else {
        log("Error fetching requests: $e");
      }
    }
    return casesList;
  }

  Future<UserModel> getPatient(String uid) async {
    try {
      final snapshot = await patentCollection.doc(uid).get();
      if (snapshot.exists) {
        final data = UserModel.fromMap(snapshot.data() as Map<String, dynamic>);
        return data;
      } else {
        return throw Exception('User not found');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<CaseModel>> getTreatmentList(String uid) async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection("students")
          .doc(uid)
          .collection('treatmentList')
          .get();
      return snapshot.docs.map((doc) {
        return CaseModel.fromFirestore(doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (e) {
      throw Exception("Failed to load treatments: $e");
    }
  }

  Future<List<CaseModel>> getActiveCases() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection("acceptedRequests")
          .where("studentId", isEqualTo: uid)
          .where("caseStatus", isEqualTo: "active")
          .get();
      return snapshot.docs.map((doc) {
        return CaseModel.fromFirestore(doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (e) {
      throw Exception("Failed to load treatments: $e");
    }
  }

  Future<List<CaseModel>> getfinishedCases() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection("acceptedRequests")
          .where("studentId", isEqualTo: uid)
          .where("caseStatus", isEqualTo: "finished")
          .get();
      return snapshot.docs.map((doc) {
        return CaseModel.fromFirestore(doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (e) {
      throw Exception("Failed to load treatments: $e");
    }
  }

  Future<List<String>> getReportPics(String reportId) async {
  List<String> reportPics = [];
String studentId= FirebaseAuth.instance.currentUser!.uid;
  try {
    DocumentSnapshot studentDoc = await FirebaseFirestore.instance
        .collection('students')
        .doc(studentId)
        .get();

    if (studentDoc.exists) {
      var data = studentDoc.data() as Map<String, dynamic>;
      List<dynamic> reportsArray = data['reports'] as List<dynamic>? ?? [];
      
      for (var report in reportsArray) {
        if (report is Map<String, dynamic> && report['reportId'] == reportId) {
          String? reportPic = report['reportPic'] as String?;
          if (reportPic != null) {
            reportPics.add(reportPic);
          }
        }
      }
    }
  } catch (e) {
    log("Error fetching reportPics: $e");
  }

  return reportPics;
}
}
