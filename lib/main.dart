import 'package:diente/auth/home_screen.dart';
import 'package:diente/auth/login/ui/login_screen.dart';
import 'package:diente/auth/signup/create_new_password_screen.dart';
import 'package:diente/auth/signup/fill_information_screen.dart';
import 'package:diente/auth/signup/medical_history_screen.dart';
import 'package:diente/auth/signup/signup_screen.dart';
import 'package:diente/core/theme/lightmode.dart';
import 'package:diente/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MaterialApp(
        home: const HomeScreen(),
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
        },
        //light and dark mode
        theme: lightMode,
        // darkTheme: darkMode,
      ),
    );
  }
}
