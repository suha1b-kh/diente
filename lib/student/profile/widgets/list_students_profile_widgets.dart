import 'package:diente/student/profile/widgets/student_profile_widget.dart';
import 'package:flutter/material.dart';

class ListStudentsProfileWidgets extends StatelessWidget {
  const ListStudentsProfileWidgets({super.key});
//not needed after enum
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 100,
      itemBuilder: (context,index){
        return StudentProfileWidget(
        studentName: 'ahmad',
        studentYear: '3',
      );
      }
      
      ) ;
  }
}