// list of Students in firestore
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diente/student/data/models/student.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore db = FirebaseFirestore.instance;

Future<List<StudentModel>> fetchAllStudents() async {
  List<StudentModel> studentsList = [];
  try {
    QuerySnapshot querySnapshot = await db.collection('students').get();
    for (var doc in querySnapshot.docs) {
      studentsList
          .add(StudentModel.fromJson(doc.data() as Map<String, dynamic>));
    }
    log(studentsList.toString());
  } catch (e) {
    log("Error fetching students: $e");
  }
  return studentsList;
}
