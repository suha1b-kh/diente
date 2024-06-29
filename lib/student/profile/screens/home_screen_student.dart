import 'package:diente/student/profile/widgets/list_patient_widgets.dart';
import 'package:diente/student/profile/widgets/list_reports.dart';
import 'package:diente/student/profile/widgets/patient_widget.dart';
import 'package:diente/student/profile/widgets/search_bar.dart';
import 'package:diente/student/profile/widgets/student_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class HomeStudentScreen extends StatelessWidget {
  const HomeStudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const StudentAppbar()),
      body: ListView(
        children: [
          Column(
            children: [
              Gap(29.h),
              const SearchStudentBar(),
              Gap(34.h),
              const ListPatientWidgets()
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF7CA0CA),
        items: const [
        
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home', ),
        // BottomNavigationBarItem(
        //     icon: ImageIcon(
        //         size: 2, AssetImage('assets/images/treatmentIcon.png')),
        //     label: 'My treatment'),
        BottomNavigationBarItem(
          
            icon: Icon(Icons.local_hospital_outlined), label: 'My treatment'),
        BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Students'),
      ]),
    );
  }
}
