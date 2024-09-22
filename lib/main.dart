import 'package:diente/auth/home_screen.dart';
import 'package:diente/auth/login/login_screen.dart';
import 'package:diente/auth/signup/create_new_password_screen.dart';
import 'package:diente/auth/signup/fill_information_screen.dart';
import 'package:diente/auth/signup/medical_history_screen.dart';
import 'package:diente/auth/signup/signup_screen.dart';
import 'package:diente/core/theme/lightmode.dart';
import 'package:diente/student/profile/screens/control_screen.dart';
import 'package:diente/student/profile/screens/edit_profile.dart';
import 'package:diente/student/profile/screens/home_screen_student.dart';
import 'package:diente/student/profile/screens/main_profile.dart';
import 'package:diente/student/profile/screens/my_Treatment.dart';
import 'package:diente/student/profile/screens/students.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MaterialApp(
        home: const ControlScreen(), //const HomeScreen(),
        //app routes to navigate
        routes: {
          //home screen
          "/home_screen": (context) => const HomeScreen(),
          //login screen
          "/login_screen": (context) => LoginScreen(),
          //signup screen
          "/signup_screen": (context) => const SignupScreen(),
          //fill profile info screen
          "/fill_profile_screen": (context) => const FillProfileScreen(),
          //fill medical history screen
          "/fill_medical_history_screen": (context) =>
              const MedicalHistoryScreen(),
          //fill medical history screen
          "/create_new_password_screen": (context) =>
              const CreateNewPasswordScreen(),
          //control screen
          "/control_screen": (context) => const ControlScreen(),
          //main profile screen
          "/main_profile": (context) => const MainProfile(),
          //Home Student Screen
          "/home_student_screen": (context) => const HomeStudentScreen(),
          //my treatment screen
          "/my_treatment_screen": (context) => const MyTreatment(),
          //students screen
          "/students_screen": (context) => const Students(),
          //EditProfile screen
          "/edit_profile": (context) => EditProfile(),
        },
        //light and dark mode
        theme: lightMode,
        // darkTheme: darkMode,
      ),
    );
  }
}
