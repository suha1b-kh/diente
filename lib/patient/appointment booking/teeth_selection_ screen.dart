
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_header.dart';
import '../widgets/custom_text_field.dart';

class TeethSelectionScreen extends StatefulWidget {
  String? patientName = "";
  ImageProvider? patientImage;

  //constructor
  TeethSelectionScreen({required this.patientName, required this.patientImage});

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
                    patientName: widget.patientName,
                    patientImage: widget.patientImage),
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
                      fontFamily: 'Poppins',
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
                  onTap: () {
                    //TODO: navigate to case information screen
                        Navigator.pushNamed(context, 'case_info_screen');
                  },
                )),
              ],
            )));
  }
}
