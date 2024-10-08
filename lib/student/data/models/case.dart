class CaseModel {
  String? patientId;
  Map<String, dynamic>? caseDescription;
  String? caseStatus;

  CaseModel({
    required this.patientId,
    required this.caseDescription,
    required this.caseStatus,
  });

  factory CaseModel.fromFirestore(Map<String, dynamic> data) {
    return CaseModel(
      patientId: data['patientId'],
      caseDescription: data['caseDescription'],
      caseStatus: data['caseStatus'],
    );
  }
}
