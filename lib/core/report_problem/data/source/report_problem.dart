import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diente/core/report_problem/data/model/report_problem_model.dart';

class ReportProblemService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<ReportProblemModel>> fetchProblems() async {
    try {
      QuerySnapshot querySnapshot =
          await _firestore.collection('problems').get();
      List<QueryDocumentSnapshot> docs = querySnapshot.docs;
      List<ReportProblemModel> problems = docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return ReportProblemModel.fromJson(data);
      }).toList();
      return problems;
    } catch (e) {
      print('Error fetching problems: $e');
      return [];
    }
  }

  Future<void> addReport(ReportProblemModel report) async {
    try {
      await _firestore.collection('problems').add(report.toJson());
    } catch (e) {
      print('Error adding report: $e');
    }
  }
}
