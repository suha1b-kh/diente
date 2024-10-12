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
      if (doc.id == auth.currentUser?.uid) {
        continue;
      }
      studentsList
          .add(StudentModel.fromJson(doc.data() as Map<String, dynamic>));
    }
    log(studentsList.toString());
  } catch (e) {
    log("Error fetching students: $e");
  }
  return studentsList;
}

Future<String?> fetchProfilePic() async {
  try {
    DocumentSnapshot docSnapshot =
        await db.collection('students').doc(auth.currentUser!.uid).get();
    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
      return data['profilePic'] as String?;
    }
  } catch (e) {
    log("Error fetching profile picture: $e");
  }
  return null;
}
