import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diente/student/data/models/case.dart';
import 'database_services.dart';

class Filter {
  var diseaseName = "all";
  var gender = "all";
  var maxAge = 200;
  var minAge = 0;
  dynamic toothNumber = "all";
  List filteredCases = [];
  List searchResult = [];
  final acceptedRequestsCollection =
      FirebaseFirestore.instance.collection("acceptedRequests");
  var translation = {
    "General diagnosis": "فحص روتيني",
    "Composite restoration": "حشوة تجميلية",
    "Fixed prosthesis": "تيجان وجسور",
    "Caries": "تسوس",
    "Root canal treatment": "علاج عصب",
    "Extraction": "خلع اسنان",
    "Removable complete denture": "طقم كامل",
    "Removable partial denture": "طقم جزئي",
    "Pedodontic": "علاج اطفال",
    "scaling": "علاج وتنطيف اللثة",
  };


  getPatientWithSpecificDisease(diseaseName) async {
    List patientWithSpecificDisease = [];

    if (diseaseName == "all") {
      List patientWithSpecificDisease =
          await DatabaseServices().getAllAcceptedRequests();
      return patientWithSpecificDisease;
    }

    try {
      final allDocs = await acceptedRequestsCollection
          .where("caseDescription.Name", isEqualTo: translation[diseaseName])
          .get();
      for (var doc in allDocs.docs) {
        patientWithSpecificDisease
            .add(CaseModel.fromFirestore(doc.data() as Map<String, dynamic>));
      }
      return patientWithSpecificDisease;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  filterData({diseaseName, gender, toothNumber, maxAge, minAge}) async {

    this.diseaseName = diseaseName ?? "all";
    this.gender = gender ?? "all";
    this.maxAge = maxAge ?? 200;
    this.minAge = minAge ?? 0;
    this.toothNumber = toothNumber ?? "all";

    filteredCases = await getPatientWithSpecificDisease(this.diseaseName);

    for (int i = 0; i < filteredCases.length; i++) {
      final patient =
          await DatabaseServices().getPatient(filteredCases[i].patientId);
      if (this.gender != "all") {
        if (patient?.gender != this.gender) continue;
      }
      if (this.toothNumber != "all") {
        if (int.parse(filteredCases[i].caseDescription["toothNumber"]) != this.toothNumber)
          continue;
      }
      if (int.parse(patient!.age) <= this.maxAge &&
          int.parse(patient.age) >= this.minAge)
        searchResult.add(filteredCases[i]);
    }

    return searchResult;
  }
}
