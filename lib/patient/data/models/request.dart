
class Request{
   late bool? isAccepted;
   late Map<String,dynamic> ?caseDescription;

   Request({
      this.isAccepted,
      this.caseDescription});


  Request.fromJson(Map<String,dynamic> json){
        isAccepted= json["isAccepted"] as bool;
        caseDescription=json["description"] as Map<String, dynamic>;
  }


  Map<String, dynamic> toJson(Request request)=> <String,dynamic>{
    "isAccepted":request.isAccepted,
    "description":request.caseDescription,
  };
}