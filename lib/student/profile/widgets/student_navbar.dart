import 'package:diente/student/profile/screens/edit_profile.dart';
import 'package:diente/student/profile/screens/home_screen_student.dart';
import 'package:diente/student/profile/screens/active_cases.dart';
import 'package:flutter/material.dart';

class StudentNavbar extends StatefulWidget {
  const StudentNavbar({super.key});

  @override
  State<StudentNavbar> createState() => _StudentNavbarState();
}

int _selectedIndex = 0;
final List<Widget> _pages = <Widget>[
  const HomeStudentScreen(),
  const ActiveCases(),
  EditProfile(), //غيرها
];

class _StudentNavbarState extends State<StudentNavbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex, //New
          onTap: _onItemTapped,
          backgroundColor: const Color(0xFF7CA0CA),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            // BottomNavigationBarItem(
            //     icon: ImageIcon(
            //         size: 2, AssetImage('assets/images/treatmentIcon.png')),
            //     label: 'My treatment'),
            BottomNavigationBarItem(
                icon: Icon(Icons.local_hospital_outlined),
                label: 'My treatment'),
            BottomNavigationBarItem(
                icon: Icon(Icons.people), label: 'Students'),
          ]),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
