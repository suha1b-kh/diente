
class CaseDetails{
  String ?diseaseName;
  late String toothNumber;
  void setName(String name){
    diseaseName=name;
  }
  void setToothNumber(String toothNumber){
    this.toothNumber=toothNumber;
  }

  String? getName(String name){
    return diseaseName;
  }
  String getToothNumber(){
    return toothNumber;
  }

}