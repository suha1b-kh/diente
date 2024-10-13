class Filter{
  var diseaseName="all";
  var gender="all";
  var maxAge=200;
  var minAge=0;
  dynamic toothNumber="all";
  List filteredPatients=[];
  List searchResult=[];
  var translation={
    "General diagnosis":"فحص روتيني",

    "Composite restoration":"حشوة تجميلية",

    "Fixed prosthesis":"تيجان وجسور",

    "Caries":"تسوس",

    "Root canal treatment":"علاج عصب",

    "Extraction":"خلع اسنان",

    "Removable complete denture":"طقم كامل",

    "Removable partial denture":"طقم جزئي",

    "Pedodontic":"علاج اطفال",

    "scaling":"علاج وتنطيف اللثة",

  };



  var patientList=[
    //Only for testing purposes
    {"pName":"amal",
      "diseaseName":"حشوة تجميلية",
      "gender":"female",
      "age":10,
      "toothNumber":13,
    },
    {"pName":"lana",
      "diseaseName":"فحص روتيني",
      "gender":"female",
      "age":20,
      "toothNumber":2,
    },
    {"pName":"ayham",
      "diseaseName":"حشوة تجميلية",
      "gender":"male",
      "age":30,
      "toothNumber":5,
    },
    {"pName":"isam",
      "diseaseName":"فحص روتيني",
      "gender":"male",
      "age":40,
      "toothNumber":8,
    }
  ];

  getPatientwithSpecificDisease(diseaseName){

    List PatientwithSpecificdisease=[];
    if(diseaseName=="all")
      return patientList;

    patientList.forEach((element){
      if(element["diseaseName"] == translation[diseaseName]) {
        PatientwithSpecificdisease.add(element);
      }
    });
    return PatientwithSpecificdisease;
  }

  filerData({diseaseName, gender,toothNumber,maxAge,minAge}){
    print("filter data");
    this.diseaseName=diseaseName ?? "all";
    this.gender=gender??"all";
    this.maxAge=maxAge ?? 200;
    this.minAge=minAge ?? 0;
    this.toothNumber=toothNumber??"all";

    filteredPatients=getPatientwithSpecificDisease(this.diseaseName);
    print(filteredPatients);

    for(int i=0;i<filteredPatients.length;i++){
      if(this.gender!="all"){
        if(filteredPatients[i]["gender"]!=this.gender)
          continue;
      }
      if(this.toothNumber!="all"){
        if(filteredPatients[i]["toothNumber"]!=this.toothNumber)
          continue;
      }
      if(filteredPatients[i]["age"]<=this.maxAge && filteredPatients[i]["age"]>=this.minAge)
        searchResult.add(filteredPatients[i]);
    }
    print(searchResult);
    return searchResult;
  }

}