import 'dart:developer';

import 'package:diente/auth/data/models/medical_history_model.dart';
import 'package:diente/auth/data/models/user.dart';
import 'package:diente/auth/data/source/auth_firebase_service.dart';
import 'package:diente/core/widgets/buttons.dart';
import 'package:diente/core/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../patient/presentation/Home/patient_home_screen.dart';

class MedicalHistoryScreen extends StatefulWidget {
  final UserModel user;
  const MedicalHistoryScreen({super.key, required this.user});

  @override
  State<MedicalHistoryScreen> createState() => _MedicalHistoryScreenState();
}

class _MedicalHistoryScreenState extends State<MedicalHistoryScreen> {
  bool diabetes = false,
      highBloodPressure = false,
      heartDisease = false,
      respiratoryDiseases = false,
      kidneyDisease = false,
      bleedingDisorders = false,
      doNotSuffer = false;

  @override
  void initState() {
    super.initState();
    diabetes = widget.user.medicalHistory['diabetes'] ?? false;
    highBloodPressure =
        widget.user.medicalHistory['highBloodPressure'] ?? false;
    heartDisease = widget.user.medicalHistory['heartDisease'] ?? false;
    respiratoryDiseases =
        widget.user.medicalHistory['respiratoryDiseases'] ?? false;
    kidneyDisease = widget.user.medicalHistory['kidneyDisease'] ?? false;
    bleedingDisorders =
        widget.user.medicalHistory['bleedingDisorders'] ?? false;
    doNotSuffer = widget.user.medicalHistory['doNotSuffer'] ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 38.w),
        child: ListView(
          children: [
            customText(
                context,
                'Do you suffer from one\nof the following diseases?',
                Theme.of(context).colorScheme.primary,
                20.sp,
                FontWeight.bold),
            Gap(60.h),
            _buildCheckboxRow(context, 'diabetes', diabetes, (value) {
              setState(() {
                if (doNotSuffer == false) {
                  diabetes = value!;
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      duration: Duration(milliseconds: 700),
                      content: Text(
                          'Cannot select both diabetes and do not suffer.'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              });
            }),
            Gap(29.h),
            _buildCheckboxRow(context, 'high blood pressure', highBloodPressure,
                (value) {
              setState(() {
                if (doNotSuffer == false) {
                  highBloodPressure = value!;
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      duration: Duration(milliseconds: 700),
                      content: Text(
                          'Cannot select both high blood pressure and do not suffer.'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              });
            }),
            Gap(29.h),
            _buildCheckboxRow(context, 'heart disease', heartDisease, (value) {
              setState(() {
                if (doNotSuffer == false) {
                  heartDisease = value!;
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      duration: Duration(milliseconds: 700),
                      content: Text(
                          'Cannot select both heart disease and do not suffer.'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              });
            }),
            Gap(29.h),
            _buildCheckboxRow(
                context, 'respiratory diseases', respiratoryDiseases, (value) {
              setState(() {
                if (doNotSuffer == false) {
                  respiratoryDiseases = value!;
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      duration: Duration(milliseconds: 700),
                      content: Text(
                          'Cannot select both respiratory diseases and do not suffer.'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              });
            }),
            Gap(29.h),
            _buildCheckboxRow(context, 'kidney disease', kidneyDisease,
                (value) {
              setState(() {
                if (doNotSuffer == false) {
                  kidneyDisease = value!;
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      duration: Duration(milliseconds: 700),
                      content: Text(
                          'Cannot select both kidney disease and do not suffer.'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              });
            }),
            Gap(29.h),
            _buildCheckboxRow(context, 'bleeding disorders', bleedingDisorders,
                (value) {
              setState(() {
                if (doNotSuffer == false) {
                  bleedingDisorders = value!;
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      duration: Duration(milliseconds: 700),
                      content: Text(
                          'Cannot select both bleeding disorders and do not suffer.'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              });
            }),
            Gap(29.h),
            _buildCheckboxRow(
                context,
                'I do not suffer from any\nchronic disease',
                doNotSuffer, (value) {
              setState(() {
                doNotSuffer = value!;
                if (value == true) {
                  diabetes = false;
                  highBloodPressure = false;
                  heartDisease = false;
                  respiratoryDiseases = false;
                  kidneyDisease = false;
                  bleedingDisorders = false;
                }
              });
            }),
            Gap(50.h),
            customButton(context, Theme.of(context).colorScheme.secondary, () {
              if (diabetes == false &&
                  highBloodPressure == false &&
                  heartDisease == false &&
                  respiratoryDiseases == false &&
                  kidneyDisease == false &&
                  bleedingDisorders == false &&
                  doNotSuffer == false) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    duration: Duration(milliseconds: 700),
                    content: Text('Please select at least one option.'),
                    backgroundColor: Colors.red,
                  ),
                );
                return;
              }

              MedicalHistoryModel medModel = MedicalHistoryModel(
                diabetes: diabetes,
                highBloodPressure: highBloodPressure,
                heartDisease: heartDisease,
                respiratoryDiseases: respiratoryDiseases,
                kidneyDisease: kidneyDisease,
                bleedingDisorders: bleedingDisorders,
                doNotSuffer: doNotSuffer,
              );
              AuthFirebaseService().fillMedicalHistory(medModel);
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => PatientHomeScreen(
                    userModel: widget.user,
                  ),
                ),
                (route) => false,
              );
            }, 'Submit', 16.sp)
          ],
        ),
      ),
    );
  }

  Widget _buildCheckboxRow(BuildContext context, String text, bool value,
      Function(bool?) onChanged) {
    return Center(
      child: Row(
        children: [
          Transform.scale(
            scale: 1.3,
            child: Checkbox(
              side: WidgetStateBorderSide.resolveWith(
                (states) => BorderSide(
                  width: 1.0,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              value: value,
              onChanged: onChanged,
              activeColor: Theme.of(context).colorScheme.secondary,
            ),
          ),
          Gap(13.w),
          customText(
            context,
            text,
            Theme.of(context).colorScheme.secondary,
            16.sp,
            FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
