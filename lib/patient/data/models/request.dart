class Request {
  late bool? isAccepted;
  late Map<String, dynamic>? caseDescription;
  String? id = "";

  Request({this.isAccepted, this.caseDescription, this.id});

  Request.fromJson(Map<String, dynamic> json) {
    isAccepted = json["isAccepted"];
    caseDescription = json["description"] as Map<String, dynamic>;
    id = json["id"];
  }

  Map<String, dynamic> toJson(Request request) => <String, dynamic>{
        "isAccepted": request.isAccepted,
        "description": request.caseDescription,
        "id": request.id,
      };
}
