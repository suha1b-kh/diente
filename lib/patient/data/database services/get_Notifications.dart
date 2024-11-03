import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<String> getStudentId() async {
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser!.uid;
  final snapshot = await FirebaseFirestore.instance
      .collection('acceptedRequests')
      .where('patientId', isEqualTo: uid)
      .where('caseStatus', isEqualTo: 'active')
      .get();
  if (snapshot.docs.isNotEmpty) {
    String studentId = snapshot.docs.first.get('studentId');
    return studentId;
  } else {
    return "";
  }
}

Future<String> getStudentName(String studentId) async {
  final snapshot = await FirebaseFirestore.instance
      .collection('students')
      .doc(studentId)
      .get();
  if (snapshot.exists) {
    String name = snapshot.get('name');
    return name;
  } else {
    return "";
  }
}
