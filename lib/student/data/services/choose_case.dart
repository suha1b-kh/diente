import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diente/student/data/models/report_model.dart';
import 'package:diente/student/data/models/student.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore db = FirebaseFirestore.instance;
chooseCase(String uid) {
  db.collection('students').doc(auth.currentUser!.uid).update({
    'cases': FieldValue.arrayUnion([uid])
  });

  db
      .collection('acceptedRequests')
      .doc(uid)
      .update({'status': 'active', 'studentId': auth.currentUser!.uid});
}

fetchCase(String patientId) {
  return db.collection('cases').doc(patientId).get();
}
