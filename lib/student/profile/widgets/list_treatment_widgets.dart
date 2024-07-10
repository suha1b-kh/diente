import 'package:diente/student/profile/widgets/treatment_widget.dart';
import 'package:flutter/material.dart';

class ListTreatmentWidgets extends StatelessWidget {
  const ListTreatmentWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 100,
      itemBuilder: (context,index){
        return TreatmentWidget(
        patientName: 'patient 1',
        
      );
      }
      
      ) ;
  }
}