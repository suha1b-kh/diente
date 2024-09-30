import 'package:diente/student/profile/widgets/patient_widget.dart';
import 'package:diente/student/profile/widgets/treatment_widget.dart';
import 'package:diente/student/profile/widgets/student_profile_widget.dart';
import 'package:flutter/material.dart';

enum WidgetType { treatment, studentProfile, patient }

class ListWidgets extends StatelessWidget {
  final WidgetType widgetType;

  const ListWidgets({super.key, required this.widgetType});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (context, index) {
        if (widgetType == WidgetType.treatment) {
          return TreatmentWidget(
            patientName: 'patient $index',
          );
        } else if (widgetType == WidgetType.studentProfile) {
          return StudentProfileWidget(
            studentName: 'Student $index',
            studentYear: '3',
          );
        } else if (widgetType == WidgetType.patient) {
          return PatientWidget(
              patientName: 'patientName', caseInformation: 'caseInformation');
        }
        return null;
      },
    );
  }
}
