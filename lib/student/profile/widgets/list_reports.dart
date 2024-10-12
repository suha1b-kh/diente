import 'package:flutter/material.dart';

import 'reports_widget.dart';

// ignore: camel_case_types
class listReportsView extends StatelessWidget {
  const listReportsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 100,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return reportsWidget(
            reportName: 'ahmad', //Todo fetch student name from firebase
            caseInformation:
                'Case Information', //Todo fetch case info from firebase
          );
        });
  }
}
