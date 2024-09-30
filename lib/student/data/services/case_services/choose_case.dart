import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diente/student/data/models/report_model.dart';
import 'package:diente/student/data/models/student.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore db = FirebaseFirestore.instance;
//  chooseCase() {
//   db.collection('requests').where('status', isEqualTo: 'waiting').get().then((value) {
//     value.docs.forEach((element) {
//       print(element.data());
//     });
//   });
//   return;
// }

Future<void> addReport(ReportModel report) async {
  try {
    await db
        .collection('reports')
        .doc(auth.currentUser!.uid)
        .set(report.toJson());
    log('report added');
  } on FirebaseException catch (e) {
    log('error $e');
  }
}

// list of Students in firestore
Future<List<StudentModel>> fetchAllStudents() async {
  List<StudentModel> studentsList = [];
  try {
    QuerySnapshot querySnapshot = await db.collection('students').get();
    for (var doc in querySnapshot.docs) {
      studentsList
          .add(StudentModel.fromJson(doc.data() as Map<String, dynamic>));
    }
  } catch (e) {
    log("Error fetching students: $e");
  }
  return studentsList;
}
