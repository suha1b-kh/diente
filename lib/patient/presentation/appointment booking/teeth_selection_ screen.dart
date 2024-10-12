// ignore_for_file: must_be_immutable

import 'package:diente/auth/data/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../data/database services/requests_database_services.dart';
import '../../data/models/case_details.dart';
import '../../data/models/request.dart';
import '../Home/patient_home_screen.dart';
import '../Review case information/case_info_screen.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_header.dart';
import '../widgets/custom_text_field.dart';

class TeethSelectionScreen extends StatefulWidget {
  UserModel user;
  CaseDetails caseDetails;

  final controller = TextEditingController();

  //constructor
  TeethSelectionScreen(
      {super.key, required this.user, required this.caseDetails});

  @override
  State<TeethSelectionScreen> createState() => _ToothSelectionScreenState();
}

class _ToothSelectionScreenState extends State<TeethSelectionScreen> {
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Form(
            key: formKey,
            child: ListView(
              children: [
                //header
                CustomHeader(
                    patientImage: NetworkImage(widget.user.profilePic),
                    patientName:
                        '${widget.user.firstName} ${widget.user.secondName}'),
                //tooth image
                SizedBox(
                  width: 317.w,
                  height: 321.h,
                  child: const Image(
                    image: AssetImage("assets/images/teeth_image.png"),
                  ),
                ),
                SizedBox(
                  height: 52.h,
                ),
                //Hint
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 35),
                  width: 272.w,
                  height: 70.h,
                  child: Text(
                    "يرجى ادخال رقم السن الذي ترغب في علاجه",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 20.sp,
                      fontFamily: 'NotoSansArabic',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),

                //Text field to enter the tooth number
                CustomTextField(
                  hint: "ادخل رقم",
                  textAlign: TextAlign.center,
                  obscureText: false,
                  inputType: TextInputType.number,
                  controller: widget.controller,
                ),
                SizedBox(height: 30.h),

                //submit button
                Center(
                    child: CustomButton(
                  height: 37.h,
                  width: 230.w,
                  borderRadius: 50.r,
                  color: Theme.of(context).colorScheme.secondary,
                  borderColor: Theme.of(context).colorScheme.secondary,
                  text: "تم",
                  fontColor: Colors.white,
                  onTap: () async {
                    PatientHomeScreen.caseDetails?.toothNumber =
                        widget.controller.text;
                    final uid = FirebaseAuth.instance.currentUser!.uid;
                    Request req = Request(caseDescription: {
                      'Name': PatientHomeScreen.caseDetails?.diseaseName,
                      'toothNumber': PatientHomeScreen.caseDetails?.toothNumber
                    }, id: uid);
                    await RequestDatabaseServices(uid: uid).addRequest(req);
                    if (widget.controller.text != '') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CaseInformationScreen(
                                  user: widget.user,
                                  caseDetails: PatientHomeScreen.caseDetails!,
                                  caseStatus: "Waiting",
                                )),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        backgroundColor: Colors.red,
                        content: Text('Please enter the tooth number'),
                      ));
                    }
                  },
                )),
              ],
            )));
  }
}
