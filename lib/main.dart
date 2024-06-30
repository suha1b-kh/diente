
import 'package:diente/patient/Home/patient_home_screen.dart';
import 'package:diente/patient/Review%20case%20information/case_info_screen.dart';
import 'package:diente/patient/Review%20case%20information/no_cases_screen.dart';
import 'package:diente/patient/appointment%20booking/disease_selection_screen.dart';
import 'package:diente/patient/appointment%20booking/teeth_selection_%20screen.dart';
import 'package:diente/patient/edit%20profile%20info/edit_patient_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/theme/lightmode.dart';



void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        child: MaterialApp(
          home:PatientHomeScreen(
            patientName: "Patient name",
            patientImage: const AssetImage("assets/images/patient.png"),
          ),
          routes: {
            //patient home screen
            "patient_home_screen": (context) => PatientHomeScreen(),
            //case information screen
            "case_info_screen": (context) => CaseInformationScreen(
                patientName: "Patient name",
                patientImage: const AssetImage("assets/images/patient.png"),
                caseStatus: "Waiting"),
            //no cases screen
            "no_cases_screen": (context) => NoCasesScreen(
                patientName: "Patient name",
                patientImage: const AssetImage("assets/images/patient.png")),
            //disease selection screen
            "disease_selection_screen": (context) => DiseaseSelectionScreen(
                patientName: "Patient name",
                patientImage: const AssetImage("assets/images/patient.png")),
            //teeth selection screen
            "teeth_selection_screen": (context) => TeethSelectionScreen(
                patientName: "Patient name",
                patientImage: const AssetImage("assets/images/patient.png")),
            //edit patient profile screen
            "edit_profile_screen": (context) => EditPatientProfileScreen(
                patientName: "Patient name",
                patientImage: const AssetImage("assets/images/patient.png")),
          },
          theme: lightMode,
        ));
  }
}
