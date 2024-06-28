import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../widgets/list_reports.dart';


// ignore: camel_case_types
class mainProfile extends StatelessWidget {
  const mainProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 100, bottom: 10),
                width: 145,
                height: 145,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(500.0)),
                  image: DecorationImage(
                    //Todo fetch student image from firebase
                    image: AssetImage('assets/images/profile.png'),

                  ),
                ),
              ),
            ),
            const Text(
              'Diente student',
              style: TextStyle(
                color: Color(0xFF1B2A57),
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
            const Gap(57),
            const Text(
              'Diente student  Reports',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF1B2A57),
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
            const Gap(28),
           const listReportsView()
            
          ],
        ),
      ),
    );
  }
}
