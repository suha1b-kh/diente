// ignore_for_file: prefer_typing_uninitialized_variables

class MedicalHistoryModel {
  final diabetes;
  final highBloodPressure;
  final heartDisease;
  final respiratoryDiseases;
  final kidneyDisease;
  final bleedingDisorders;
  final doNotSuffer;

  MedicalHistoryModel({
    required this.diabetes,
    required this.highBloodPressure,
    required this.heartDisease,
    required this.respiratoryDiseases,
    required this.kidneyDisease,
    required this.bleedingDisorders,
    required this.doNotSuffer,
  });

  factory MedicalHistoryModel.fromMap(Map<String, dynamic> map) {
    return MedicalHistoryModel(
      diabetes: map['diabetes'],
      highBloodPressure: map['highBloodPressure'],
      heartDisease: map['heartDisease'],
      respiratoryDiseases: map['respiratoryDiseases'],
      kidneyDisease: map['kidneyDisease'],
      bleedingDisorders: map['bleedingDisorders'],
      doNotSuffer: map['doNotSuffer'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'diabetes': diabetes,
      'highBloodPressure': highBloodPressure,
      'heartDisease': heartDisease,
      'respiratoryDiseases': respiratoryDiseases,
      'kidneyDisease': kidneyDisease,
      'bleedingDisorders': bleedingDisorders,
      'doNotSuffer': doNotSuffer,
    };
  }
}
