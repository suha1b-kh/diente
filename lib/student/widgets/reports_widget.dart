// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: camel_case_types
class reportsWidget extends StatelessWidget {
  String reportName;
  String caseInformation;
  reportsWidget({
    Key? key,
    required this.reportName,
    required this.caseInformation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 170,
              height: 170,
              decoration: ShapeDecoration(
                color: const Color(0xFFF2F4F7),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 57),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      Text(
                        reportName,
                        style: const TextStyle(
                          color: Color(0xFF1B2A57),
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                       Text(
                        caseInformation,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xFF7CA0CA),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
