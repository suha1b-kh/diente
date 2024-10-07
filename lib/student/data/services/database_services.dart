import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diente/auth/data/models/user.dart';
import 'package:diente/student/data/models/case.dart';

class DatabaseServices {
  final acceptedRequestsCollection =
      FirebaseFirestore.instance.collection('acceptedRequests');

  final patentCollection = FirebaseFirestore.instance.collection("patients");

  final treatmentCollection =
      FirebaseFirestore.instance.collection('treatments');

  Future<List<Map<String, dynamic>>> getAllAcceptedRequests() async {
    try {
      final allDocs = await acceptedRequestsCollection.get();
      log(allDocs.size.toString());
      if (allDocs.size > 0) {
        return allDocs.docs.map((doc) => doc.data()).toList();
      } else {
        return [];
      }
    } catch (e) {
      throw Exception(e.toString());
    }
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
}
