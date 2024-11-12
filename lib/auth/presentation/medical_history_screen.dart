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
            customText(context, 'هل تعاني من احد الامراض التالية؟',
                Theme.of(context).colorScheme.primary, 20.sp, FontWeight.bold),
            Gap(60.h),
            _buildCheckboxRow(context, 'السكري', diabetes, (value) {
              setState(() {
                if (doNotSuffer == false) {
                  diabetes = value!;
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      duration: Duration(milliseconds: 700),
                      content: Text(
                          'لا يمكن اختيار السكري وعدم المعاناة في نفس الوقت.'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              });
            }),
            Gap(29.h),
            _buildCheckboxRow(context, 'ارتفاع ضغط الدم', highBloodPressure,
                (value) {
              setState(() {
                if (doNotSuffer == false) {
                  highBloodPressure = value!;
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      duration: Duration(milliseconds: 700),
                      content: Text(
                          'لا يمكن اختيار ارتفاع ضغط الدم وعدم المعاناة في نفس الوقت.'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              });
            }),
            Gap(29.h),
            _buildCheckboxRow(context, 'امراض القلب', heartDisease, (value) {
              setState(() {
                if (doNotSuffer == false) {
                  heartDisease = value!;
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      duration: Duration(milliseconds: 700),
                      content: Text(
                          'لا يمكن اختيار امراض القلب وعدم المعاناة في نفس الوقت.'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              });
            }),
            Gap(29.h),
            _buildCheckboxRow(
                context, 'أمراض الجهاز التنفسي', respiratoryDiseases, (value) {
              setState(() {
                if (doNotSuffer == false) {
                  respiratoryDiseases = value!;
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      duration: Duration(milliseconds: 700),
                      content: Text(
                          'لا يمكن اختيار أمراض الجهاز التنفسي وعدم المعاناة في نفس الوقت.'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              });
            }),
            Gap(29.h),
            _buildCheckboxRow(context, 'امراض الكلى', kidneyDisease, (value) {
              setState(() {
                if (doNotSuffer == false) {
                  kidneyDisease = value!;
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      duration: Duration(milliseconds: 700),
                      content: Text(
                          'لا يمكن اختيار امراض الكلى وعدم المعاناة في نفس الوقت.'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              });
            }),
            Gap(29.h),
            _buildCheckboxRow(context, 'اضطرابات نزف الدم', bleedingDisorders,
                (value) {
              setState(() {
                if (doNotSuffer == false) {
                  bleedingDisorders = value!;
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      duration: Duration(milliseconds: 700),
                      content: Text(
                          'لا يمكن اختيار اضطرابات نزف الدم وعدم المعاناة في نفس الوقت.'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              });
            }),
            Gap(29.h),
            _buildCheckboxRow(context, 'لا اعاني من مرض مزمن', doNotSuffer,
                (value) {
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
                    content: Text('يرجى اختيار خيار واحد على الأقل.'),
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
            }, 'ادخال', 16.sp)
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
