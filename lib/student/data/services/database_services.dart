import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diente/auth/data/models/user.dart';
import 'package:diente/student/data/models/case.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseServices {
  final acceptedRequestsCollection =
      FirebaseFirestore.instance.collection('acceptedRequests');

  final patentCollection = FirebaseFirestore.instance.collection("patients");

  final treatmentCollection =
      FirebaseFirestore.instance.collection('treatments');

  Future<List<CaseModel>> getAllAcceptedRequests() async {
    List<CaseModel> casesList = [];

    try {
      QuerySnapshot querySnapshot = await acceptedRequestsCollection.get();
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

  Future<UserModel?> getPatient(String uid) async {
    try {
      final snapshot = await patentCollection.doc(uid).get();
      if (snapshot.exists) {
        final data = UserModel.fromMap(snapshot.data() as Map<String, dynamic>);
        return data;
      } else {
        return null;
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
   Future<List<CaseModel>>getActiveCases() async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection("acceptedRequests")
          .where("studentId", isEqualTo: uid)
          .where("caseStatus", isEqualTo: "accepted")
          .get();
      return snapshot.docs.map((doc) {
        return CaseModel.fromFirestore(doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (e) {
      throw Exception("Failed to load treatments: $e");
    }
  }
}
