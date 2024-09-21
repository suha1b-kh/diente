import 'dart:developer';
import 'package:diente/auth/data/models/user.dart';
import 'package:diente/patient/data/database%20services/requests_database_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../case_details.dart';
import '../Review case information/case_info_screen.dart';
import '../Review case information/no_cases_screen.dart';
import '../appointment booking/disease_selection_screen.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_header.dart';


// ignore: must_be_immutable
class PatientHomeScreen extends StatefulWidget {
  final UserModel? userModel;
  static CaseDetails? caseDetails = CaseDetails();

  // Constructor
  PatientHomeScreen({super.key, this.userModel});

  @override
  State<PatientHomeScreen> createState() => _PatientHomeScreenState();
}

class _PatientHomeScreenState extends State<PatientHomeScreen> {
  final user = FirebaseAuth.instance.currentUser!.email!.split('@')[0];
  late final uid;
  late bool isExist;

  /*String patientName ;
   ImageProvider patientImage; */
  @override
  void initState() {
    super.initState();
    uid = widget.userModel?.email;
    checkExistence();
    getData();
  }

  Future<void> checkExistence() async {
    isExist = await RequestDatabaseServices(uid: uid!).checkExist(uid);
  }
  Future<void> getData()async{
     PatientHomeScreen.caseDetails?.diseaseName= await RequestDatabaseServices(uid: uid).getData();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          //Header
          CustomHeader(
            patientName:
                '${widget.userModel?.firstName} ${widget.userModel?.secondName}',
            patientImage: const AssetImage("assets/images/patient.png"),
          ),
          SizedBox(
            height: 101.h,
            width: 375.w,
          ),
          //Logo
          SizedBox(
              width: 214.28.w,
              height: 96.79.h,
              child: const Image(image: AssetImage("assets/images/logo2.png"))),
          SizedBox(
            height: 3.h,
          ),
          Center(
              child: Text(
            "best place for free dental treatment",
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontSize: 13.sp,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
          )),
          SizedBox(
            height: 175.h,
            width: 375.w,
          ),

          //Appointment booking button
          CustomButton(
            width: 342.w,
            height: 55.h,
            borderRadius: 50.r,
            color: Theme.of(context).colorScheme.secondary,
            fontColor: Colors.white,
            borderColor: Theme.of(context).colorScheme.secondary,
            text: "حجز موعد جديد",
            onTap: () async {
              if (!isExist) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DiseaseSelectionScreen(
                          //edited
                          userModel: widget.userModel!,
                          caseDetails: PatientHomeScreen.caseDetails!)),
                );
              } else {
                log("already has a case");
                _dialogBuilder(context);
              }
            },
          ),

          //view case information button
          CustomButton(
            width: 342.w,
            height: 55.h,
            borderRadius: 50.r,
            color: Colors.white,
            fontColor: Theme.of(context).colorScheme.secondary,
            borderColor: Theme.of(context).colorScheme.secondary,
            text: "مراجعة معلومات الحالة",
            onTap: () async {
              if (isExist) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CaseInformationScreen(
                            caseDetails: PatientHomeScreen.caseDetails!,
                            userModel: widget.userModel!,
                            caseStatus: "Waiting", //need to be edited
                          )),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          NoCasesScreen(userModel: widget.userModel!)),
                );
              }
            },
          ),
          CustomButton(
            width: 342.w,
            height: 55.h,
            borderRadius: 50.r,
            color: Colors.red,
            fontColor: Colors.white,
            borderColor: Colors.red,
            text: "تسجيل الخروج",
            onTap: () async {
              log(FirebaseAuth.instance.currentUser!.email.toString());
              if (FirebaseAuth.instance.currentUser != null) {
                await FirebaseAuth.instance.signOut();
              }
              // ignore: use_build_context_synchronously
              Navigator.popAndPushNamed(context, '/login_screen');
            },
          ),
        ],
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Directionality(
              textDirection: TextDirection.rtl,
              child: Text(
                'تنبيه!',
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              )),
          content: Directionality(
              textDirection: TextDirection.rtl,
              child: Text(
                "لقد قمت بحجز موعد مسبقاً,  لا يمكن حجز اكثر من موعد في آنٍ واحد",
                style: TextStyle(fontSize: 17.sp),
              )),
          actions: <Widget>[],
        );
      },
    );
  }
}
