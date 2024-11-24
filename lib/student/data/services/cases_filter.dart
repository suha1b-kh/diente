import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diente/student/data/models/case.dart';
import 'database_services.dart';

class Filter {
  dynamic diseaseName = "all";
  dynamic gender = "all";
  dynamic maxAge = 200;
  dynamic minAge = 0;
  dynamic toothNumber = "all";
  List casesWithSpecificDisease = [];
  Future<List<CaseModel>>? searchResult;
  List<CaseModel> conditionFulfiller = [];
  final acceptedRequestsCollection =
      FirebaseFirestore.instance.collection("acceptedRequests");
  var translation = {
    "General diagnosis": "فحص روتيني",
    "Composite restoration": "حشوة تجميلية",
    "Front tooth decay": "تسوس الاسنان الامامية",
    "Back tooth decay": "تسوس الاسنان الخلفية",
    "Root canal treatment": "عصب الاسنان",
    "Extraction": "خلع اسنان",
    "Removable partial denture": "طقم كامل متحرك",
  };

  var genderTranslate ={
    "ذكر":"Male",
    "أنثى":"Female"
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
        patientWithSpecificDisease.add(CaseModel.fromFirestore(doc.data()));
      }
      return patientWithSpecificDisease;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<CaseModel>>? filterData(
      {diseaseName, gender, toothNumber, maxAge, minAge}) async {
    this.diseaseName = diseaseName ?? "all";
    this.gender = gender ?? "all";
    this.maxAge = maxAge ?? 200;
    this.minAge = minAge ?? 0;
    this.toothNumber = toothNumber ?? "all";
    casesWithSpecificDisease =
        await getPatientWithSpecificDisease(this.diseaseName);

    for (int i = 0; i < casesWithSpecificDisease.length; i++) {
      final patient = await DatabaseServices()
          .getPatient(casesWithSpecificDisease[i].patientId);
      if (this.gender != "all") {
        if (genderTranslate[patient.gender] != this.gender) {
          continue;
        }
      }
      if (this.toothNumber != "all") {
        if (int.parse(
                casesWithSpecificDisease[i].caseDescription["toothNumber"]) !=
            this.toothNumber) {
          continue;
        }
      }
      if (int.parse(patient.age) <= this.maxAge &&
          int.parse(patient.age) >= this.minAge) {
        conditionFulfiller.add(casesWithSpecificDisease[i]);
        searchResult = Future.value(conditionFulfiller);
      }
      // casesWithSpecificDisease[i]);
    }

    return searchResult as Future<List<CaseModel>>;
  }
}
