class Request {
  late Map<String, dynamic>? caseDescription;
  String? id = "";

  Request({this.caseDescription, this.id});

  Request.fromJson(Map<String, dynamic> json) {
    caseDescription = json["description"] as Map<String, dynamic>;
    id = json["patientId"];
  }

  Map<String, dynamic> toJson(Request request) => <String, dynamic>{
        "description": request.caseDescription,
        "patientId": request.id,
      };
}
