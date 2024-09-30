import 'package:diente/student/profile/screens/home_screen_student.dart';
import 'package:diente/student/profile/screens/my_Treatment.dart';
import 'package:diente/student/profile/screens/students.dart';
import 'package:flutter/material.dart';

int _selectedIndex = 0;
final List<Widget> _pages = <Widget>[
  const HomeStudentScreen(),
  const MyTreatment(),
  const Students(),
];

class ControlScreen extends StatefulWidget {
  const ControlScreen({super.key});

  @override
  State<ControlScreen> createState() => _ControlScreenState();
}

class _ControlScreenState extends State<ControlScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          unselectedIconTheme:
              IconThemeData(color: Theme.of(context).colorScheme.surface),
          unselectedItemColor: Theme.of(context).colorScheme.surface,
          selectedFontSize: 20,
          unselectedFontSize: 15,
          showUnselectedLabels: false,
          currentIndex: _selectedIndex, //New
          onTap: _onItemTapped,
          backgroundColor: const Color(0xFF7CA0CA),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                size: 35,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.local_hospital_outlined,
                  size: 35,
                ),
                label: 'My treatment'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.people,
                  size: 35,
                ),
                label: 'Students'),
          ]),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
