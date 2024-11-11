// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:diente/auth/data/models/user.dart';
import 'package:diente/auth/presentation/medical_history_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../data/database services/requests_database_services.dart';
import '../../data/models/case_details.dart';
import '../Home/patient_home_screen.dart';
import '../widgets/custom_button.dart';
import '../widgets/patient_image_and_name.dart';
import 'no_cases_screen.dart';

class CaseInformationScreen extends StatefulWidget {
  final UserModel user;
  late String? caseStatus;
  late CaseDetails? caseDetails;
  late String caseLocation = "";
  String uid = "";
  Color getColor(String status) {
    //TODO: return color based on case status
    if (status == "Active") {
      return const Color(0xFF11C72E);
    } else if (status == "Waiting") {
      return const Color(0xFFFBBC05);
    } else if (status == "Finished") {
      return Colors.blue;
    } else {
      return Colors.red;
    }
  }

  //constructor
  CaseInformationScreen({
    super.key,
    required this.user,
  });

  @override
  State<CaseInformationScreen> createState() => _CaseInformationScreenState();
}

class _CaseInformationScreenState extends State<CaseInformationScreen> {
  late String uid;
  @override
  void initState() {
    super.initState();
    uid = FirebaseAuth.instance.currentUser!.uid;
  }

  Future<String>? getData(String uid) async {
    String name = await RequestDatabaseServices().getData(uid);
    return name;
  }

  Future<String> getCaseStatus(String uid) async {
    String status = await RequestDatabaseServices().getCaseStatus(uid);
    return status;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              log(widget.user.firstName);
              return PatientHomeScreen(
                userModel: widget.user,
              );
            }));
          },
        ),
      ),
      body: ListView(
        children: [
          //patient image and name
          PatientImageAndName(
              patientName: "${widget.user.firstName} ${widget.user.secondName}",
              patientImage: NetworkImage(widget.user.profilePic)),
          SizedBox(
            height: 31.h,
          ),
          //disease name
          Center(
            child: SizedBox(
                width: 346.w,
                height: 70.h,
                child: FutureBuilder<String>(
                    future: getData(uid),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        log(snapshot.data!);
                        return Text(snapshot.data!,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              fontSize: 32.sp,
                              fontFamily: 'NotoSansArabic',
                              fontWeight: FontWeight.w700,
                            ));
                      }
                    })),
          ),
          SizedBox(
            height: 17.h,
          ),
          //Case Status
          Center(
            child: SizedBox(
                width: 168.w,
                height: 40.h,
                child: FutureBuilder<String>(
                    future: getCaseStatus(uid),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        log(snapshot.data!);
                        return Text(
                          snapshot.data!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: widget.getColor(snapshot.data!),
                            fontSize: 21.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        );
                      }
                    })),
          ),
          SizedBox(
            height: 120.h,
          ),
          //Review patient history button
          CustomButton(
            width: 342.w,
            height: 55.h,
            borderRadius: 50.r,
            color: Theme.of(context).colorScheme.secondary,
            fontColor: Colors.white,
            borderColor: Theme.of(context).colorScheme.secondary,
            text: "مراجعة السجل المرضي",
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return MedicalHistoryScreen(user: widget.user);
              }));
            },
          ),
          SizedBox(
            height: 5.h,
          ),
          //remove case button
          FutureBuilder<String>(
              future: getCaseStatus(uid),
              builder: (context, snapshot) {
                if (snapshot.data == "Waiting") {
                  return CustomButton(
                    width: 342.w,
                    height: 55.h,
                    borderRadius: 50.r,
                    color: const Color(0xFFEF0107),
                    fontColor: Colors.white,
                    borderColor: const Color(0xFFEF0107),
                    text: "الغاء الموعد",
                    onTap: () async {
                      final uid = FirebaseAuth.instance.currentUser!.uid;
                      String location =
                          await RequestDatabaseServices().getCaseLocation(uid);
                      if (location == "requests") {
                        await RequestDatabaseServices().deleteRequest(uid);
                      } else if (location == "acceptedRequests") {
                        await RequestDatabaseServices()
                            .deleteAcceptedRequest(uid);
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                NoCasesScreen(user: widget.user)),
                      );

                      log('الغاء');
                    },
                  );
                } else {
                  return CustomButton(
                    width: 342.w,
                    height: 55.h,
                    borderRadius: 50.r,
                    color: const Color(0xFFEF0107),
                    fontColor: Colors.white,
                    borderColor: const Color(0xFFEF0107),
                    text: "الغاء الموعد",
                    onTap: () async {
                      final uid = FirebaseAuth.instance.currentUser!.uid;
                      String location =
                          await RequestDatabaseServices().getCaseLocation(uid);
                      if (location == "requests") {
                        await RequestDatabaseServices().deleteRequest(uid);
                      } else if (location == "acceptedRequests") {
                        await RequestDatabaseServices()
                            .deleteAcceptedRequest(uid);
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                NoCasesScreen(user: widget.user)),
                      );

                      log('الغاء');
                    },
                  );
                }
              })
        ],
      ),
    );
  }
}
