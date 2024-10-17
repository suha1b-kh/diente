class ReportModel {
  final String caseName;
  final String reportPic;
  final String reportId;

  ReportModel({
    required this.caseName,
    required this.reportPic,
    required this.reportId,
  });

  factory ReportModel.fromJson(Map<String, dynamic> json) {
    return ReportModel(
      caseName: json['caseName'],
      reportPic: json['reportPic'],
      reportId: json['reportId'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'caseName': caseName,
      'reportPic': reportPic,
      'reportId': reportId,
    };
  }
}
