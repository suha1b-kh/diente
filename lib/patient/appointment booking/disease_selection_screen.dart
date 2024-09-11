// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../models/disease.dart';
import '../widgets/custom_header.dart';
import '../widgets/disease_card.dart';

class DiseaseSelectionScreen extends StatefulWidget {
  String? patientName = "";
  ImageProvider? patientImage;

  //constructor
  DiseaseSelectionScreen(
      {super.key, required this.patientName, required this.patientImage});

  @override
  State<DiseaseSelectionScreen> createState() => _DiseaseSelectionScreenState();
}

class _DiseaseSelectionScreenState extends State<DiseaseSelectionScreen> {
  //a tentative list of diseases until the database is created
  List<Disease> diseases = [
    Disease(
        name: "فحص روتيني",
        description: "يتم اجراء فحص عام للاسنان والتأكد من سلامتها"),
    Disease(
        name: "خلع اسنان", description: "يتم خلع الاسنان اذا كانت بحاجة خلع"),
    Disease(
        name: "فحص روتيني",
        description: "يتم اجراء فحص عام للاسنان والتأكد من سلامتها"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(children: [
          //Header
          CustomHeader(
              patientName: widget.patientName,
              patientImage: widget.patientImage),
          //Hint
          SizedBox(
            width: 326.w,
            height: 48.h,
            child: Text(
              'يرجى اختيار نوع العلاج المناسب',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 24.sp,
                fontFamily: 'NotoSansArabic',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          //list of diseases
          ...List.generate(diseases.length, (index) {
            //TODO: return custom cards
            return CustomCard(
              title: diseases[index].name,
              description: diseases[index].description,
              onTap: () {
                //TODO: navigate to Tooth Selection Screen
                Navigator.pushNamed(context, 'teeth_selection_screen');
              },
            );
          }),
        ]));
  }
}
