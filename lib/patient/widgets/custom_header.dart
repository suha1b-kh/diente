import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomHeader extends StatelessWidget {
  String? patientName = "";
  ImageProvider? patientImage;

  CustomHeader({this.patientName, this.patientImage});

  @override
  Widget build(BuildContext context) {
    //patient image, name and notifications icon
    return SizedBox(
      height: 80.h,
      width: 375.w,
      child: Stack(
        children: [
          //image & name
          Positioned(
            left: 16.w,
            top: 20.h,
            child: InkWell(
                child: Row(
                  children: [
                    //patient image
                    Container(
                      width: 35.w,
                      height: 35.h,
                      decoration: ShapeDecoration(
                        image: DecorationImage(
                          image: patientImage!,
                          fit: BoxFit.fill,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.50.r),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    //patient name
                    Text(
                      patientName!,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 13.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  //TODO: navigate to edit profile screen
                  Navigator.pushNamed(context, 'edit_profile_screen');
                }),
          ),

          //notification icon
          Positioned(
              left: 319.w,
              top: 17.h,
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications,
                    size: 27.sp,
                    color: Theme.of(context).colorScheme.secondary,
                  )))
        ],
      ),
    );
  }
}
