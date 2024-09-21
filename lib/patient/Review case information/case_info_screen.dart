// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diente/patient/case_details.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../auth/data/models/user.dart';
import '../Home/patient_home_screen.dart';
import '../data/database services/requests_database_services.dart';
import '../widgets/custom_button.dart';
import '../widgets/patient_image_and_name.dart';
import 'no_cases_screen.dart';

class CaseInformationScreen extends StatefulWidget {
  /*String patientName = "";
  ImageProvider patientImage;*/
  String caseStatus = "";
  UserModel userModel;
  CaseDetails caseDetails ;

  Color getColor(String status) {
    //TODO: return color based on case status
    if (status == "Active")
      return Color(0xFF11C72E);
    else if (status == "Waiting")
      return Color(0xFFFBBC05);
    else if (status == "Finished")
      return Colors.blue;
    else
      return Colors.red;
  }

  //constructor
  CaseInformationScreen(
      {required this.userModel,
      required this.caseStatus,
        required this.caseDetails
      });

  @override
  State<CaseInformationScreen> createState() => _CaseInformationScreenState();
}

class _CaseInformationScreenState extends State<CaseInformationScreen> {

 /* @override
  void initState(){
    super.initState();
    getName();

  }


  Future<void> getName() async {
    final uid = widget.userModel?.email;
    bool isExist = await RequestDatabaseServices(uid: uid!).checkExist(uid);

    if (isExist) {
      final request = (await RequestDatabaseServices(uid: uid).getRequest());
      PatientHomeScreen.caseDetails?.diseaseName =
      request.caseDescription?["Name"];
      PatientHomeScreen.caseDetails?.toothNumber =
      request.caseDescription?["toothNumber"];
    }

  }*/

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          // Navigate back to the home page when the back button is pressed
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (context) =>
                      PatientHomeScreen(
                        userModel: widget.userModel,
                      )),
                  (Route route) => false);
          return false; // Returning false prevents the default back button behavior
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: ListView(
            children: [
              //notification button
              Container(
                  height: 50.h,
                  width: 50.w,
                  margin: EdgeInsets.only(top: 17.h, right: 8.w),
                  alignment: Alignment.topRight,
                  child: IconButton(
                    alignment: Alignment.topRight,
                    onPressed: () {},
                    icon: Icon(
                      Icons.notifications,
                      size: 27.sp,
                      color: Theme
                          .of(context)
                          .colorScheme
                          .secondary,
                    ),
                  )),
              //patient image and name
              PatientImageAndName(
                  patientName:
                  '${widget.userModel.firstName} ${widget.userModel
                      .secondName}',
                  patientImage:
                  const AssetImage('assets/images/patient.png')),
              SizedBox(
                height: 31.h,
              ),
              //disease name
              Center(
                child: SizedBox(
                  width: 346.w,
                  height: 70.h,
                  child: Text(widget.caseDetails!.diseaseName ,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Theme
                            .of(context)
                            .colorScheme
                            .secondary,
                        fontSize: 32.sp,
                        fontFamily: 'NotoSansArabic',
                        fontWeight: FontWeight.w700,
                      )),
                ),
              ),
              SizedBox(
                height: 17.h,
              ),
              //Case Status
              Center(
                child: SizedBox(
                  width: 168.w,
                  height: 30.h,
                  child: Text(
                    widget.caseStatus,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: widget.getColor(widget.caseStatus),
                      fontSize: 21.sp,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 177,
              ),
              //Review patient history button
              CustomButton(
                width: 342.w,
                height: 55.h,
                borderRadius: 50.r,
                color: Theme
                    .of(context)
                    .colorScheme
                    .secondary,
                fontColor: Colors.white,
                borderColor: Theme
                    .of(context)
                    .colorScheme
                    .secondary,
                text: "الصفحة الرئيسية",
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) =>
                              PatientHomeScreen(userModel: widget.userModel)),
                          (Route<dynamic> route) => false);
                },
              ),
              SizedBox(
                height: 5.h,
              ),
              //remove case button
              CustomButton(
                width: 342.w,
                height: 55.h,
                borderRadius: 50.r,
                color: const Color(0xFFEF0107),
                fontColor: Colors.white,
                borderColor: const Color(0xFFEF0107),
                text: "الغاء الموعد",
                onTap: () async {
                  final uid = widget.userModel.email;
                  await RequestDatabaseServices(uid: uid).deleteRequest();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            NoCasesScreen(userModel: widget.userModel)),
                  );
                },
              ),
            ],
          ),
        ));
  }

}



