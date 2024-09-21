// ignore_for_file: must_be_immutable
import 'package:diente/patient/presentation/appointment%20booking/teeth_selection_%20screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../auth/data/models/user.dart';
import '../../case_details.dart';
import '../../data/models/disease.dart';
import '../Home/patient_home_screen.dart';
import '../widgets/custom_header.dart';
import '../widgets/disease_card.dart';


class DiseaseSelectionScreen extends StatefulWidget {
  /*String patientName = "";
  ImageProvider patientImage;*/
  UserModel userModel;
  CaseDetails caseDetails;

  //constructor
  DiseaseSelectionScreen({required this.userModel, required this.caseDetails});

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
              patientName:
                  '${widget.userModel.firstName} ${widget.userModel.secondName}',
              patientImage: const AssetImage('assets/images/patient.png')),
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
              PatientHomeScreen.caseDetails?.diseaseName=diseases[index].name;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TeethSelectionScreen(
                          userModel: widget.userModel,
                          caseDetails: PatientHomeScreen.caseDetails!)),
                );
              },
            );
          }),
        ]));
  }
}
