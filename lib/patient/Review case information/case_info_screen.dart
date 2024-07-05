
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/custom_button.dart';
import '../widgets/patient_image_and_name.dart';

class CaseInformationScreen extends StatefulWidget {
  String patientName = "";
  ImageProvider? patientImage;
  String disease = "فحص روتيني";
  String caseStatus = "";

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
      {required this.patientName,
      required this.patientImage,
      required this.caseStatus});

  @override
  State<CaseInformationScreen> createState() => _CaseInformationScreenState();
}

class _CaseInformationScreenState extends State<CaseInformationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
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
                  color: Theme.of(context).colorScheme.secondary,
                ),
              )),
          //patient image and name
          PatientImageAndName(
              patientName: widget.patientName,
              patientImage: widget.patientImage),
          SizedBox(
            height: 31.h,
          ),
          //disease name
          Center(
            child: SizedBox(
              width: 346.w,
              height: 70.h,
              child: Text(widget.disease,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
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
              height: 39.h,
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
            height: 168,
          ),
          //Review patient history button
          CustomButton(
            width: 342.w,
            height: 55.h,
            borderRadius: 50.r,
            color: Theme.of(context).colorScheme.secondary,
            fontColor: Theme.of(context).colorScheme.surface,
            borderColor: Theme.of(context).colorScheme.secondary,
            text: "مراجعة السجل المرضي",
            onTap: () {},
          ),
          SizedBox(
            height: 5.h,
          ),
          //remove case button
          CustomButton(
            width: 342.w,
            height: 55.h,
            borderRadius: 50.r,
            color: Color(0xFFEF0107),
            fontColor: Theme.of(context).colorScheme.surface,
            borderColor: Color(0xFFEF0107),
            text: "الغاء الموعد",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
