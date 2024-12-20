import 'package:diente/student/data/models/student.dart';
import 'package:diente/student/profile/screens/students_reports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class StudentProfileWidget extends StatelessWidget {
  dynamic stdModel;
  StudentProfileWidget({
    super.key,
    this.stdModel
});
  // StudentProfileWidget({
  //   super.key,
  //   required this.studentName,
  //   required this.studentYear,
  //   required this.phone,
  //   required this.profilePic,
  // });
  // String studentName;
  // String studentYear;
  // String profilePic;
  // String phone;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 18.w),
          child: Container(
            width: 335.w,
            height: 120.h,
            decoration: ShapeDecoration(
              color: const Color(0xFFF2F4F7),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Row(
              children: [
                Gap(14.w),
                CircleAvatar(
                  radius: 30.r,
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  backgroundImage:
                      stdModel.profilePic.isNotEmpty ? NetworkImage(stdModel.profilePic) : null,
                  child:  stdModel.profilePic.isEmpty
                      ? Text(
                          '${stdModel.name[0].toUpperCase()}${stdModel.name[1].toUpperCase()}')
                      : null,
                ),
                Gap(20.w),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 190.w,
                      child: Text(
                        stdModel.name,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 16.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 0.h,
                        ),
                      ),
                    ),
                    Text(
                      stdModel.year,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 14.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        height: 0.h,
                      ),
                    )
                  ],
                ),
                IconButton(icon: const Icon(Icons.arrow_forward_ios),onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ViewReports(
                          stdModel: stdModel
                        )),
                  );
                },),
              ],
            ),
          ),
        )
      ],
    );
  }
}
