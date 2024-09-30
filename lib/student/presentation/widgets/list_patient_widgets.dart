import 'package:diente/student/presentation/widgets/patient_widget.dart';
import 'package:flutter/material.dart';

class ListPatientWidgets extends StatelessWidget {
  const ListPatientWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 100,
        itemBuilder: (context, index) {
          return PatientWidget(
            patientName: 'patient',
            caseInformation: 'Case Information',
          );
        });
  }
}
