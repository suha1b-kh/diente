import 'package:diente/auth/home_screen.dart';
import 'package:diente/auth/login/login_screen.dart';
import 'package:diente/auth/signup/signup_screen.dart';
import 'package:diente/core/theme/darkmode.dart';
import 'package:diente/core/theme/lightmode.dart';
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
        home: const HomeScreen(),
        //app routes to navigate
        routes: {
          "/home_screen": (context) => const HomeScreen(),
          "/login_screen": (context) => LoginScreen(),
          "/signup_screen": (context) => const SignupScreen(),
        },
        //light and dark mode
        theme: lightMode,
        // darkTheme: darkMode,
      ),
    );
  }
}
