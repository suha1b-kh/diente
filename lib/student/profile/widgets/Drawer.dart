import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../filter-bloc/filter_cubit.dart';
import '../../filter-bloc/patient_list_cubit.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  late PersistentBottomSheetController controller;
  GlobalKey formKey = GlobalKey();
  final minAgeController = TextEditingController();
  final maxAgeController = TextEditingController();
  final toothNumController = TextEditingController();

  dynamic gender = "all";
  dynamic treatmentType = "all";
  dynamic minAge = 0;
  dynamic maxAge = 200;
  dynamic toothNum = "all";

  List treatmentTypeList = [
    "all",
    "Removable complete denture",
    "Removable partial denture",
    "Composite restoration",
    "Root canal treatment",
    "General diagnosis",
    "Fixed prosthesis",
    "Pedodontic",
    "Extraction",
    "scaling",
    "Caries",
  ];
  List genderList = ["Female", "Male"];

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Container(
          child: Padding(
          padding: EdgeInsets.only(top: 30.h),
          child:
          ListView(children: [
            Wrap(
              children: [
               Padding(
                padding: EdgeInsets.all(17),
                child: Text(
                  "Treatment type",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20.sp,
                      color: Theme.of(context).colorScheme.secondary
                  ),
                ),
               ),
                Padding(
                  padding: EdgeInsets.only(left: 15.w),
                  child: DropdownMenu(
                    width: 282.w,
                    menuHeight: 300.h,
                    initialSelection: treatmentType,
                    textStyle: TextStyle(color: Colors.black),
                    inputDecorationTheme: InputDecorationTheme(
                       filled: true,
                       fillColor:Color(0xFFF2F4F7) ,
                       enabledBorder: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(15.r)),
                        borderSide:BorderSide(color: Colors.white,)
                       ),
                     ),
                      dropdownMenuEntries: List.generate(
                        treatmentTypeList.length, (index) {
                        return DropdownMenuEntry(
                            value: treatmentTypeList[index],
                            label: treatmentTypeList[index]);
                        }),
                        onSelected: (val) {
                        treatmentType = val;
                      },
                    ),
                ),
              ],
            ),

             SizedBox(
              height: 10.h,
            ),

             Padding(
              padding: EdgeInsets.all(17),
              child: Text(
                "Gender",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20.sp,
                  color: Theme.of(context).colorScheme.secondary),
              ),
            ),

            Padding(
                padding: EdgeInsets.only(left: 15.w),
                child:
                BlocBuilder<DrawerCubit, DrawerState>(
                  builder: (BuildContext context,
                      DrawerState state) {
                    return Wrap(
                      children: List.generate(
                        genderList.length, (index) {
                        return Container(
                        width: 150.w,
                        padding: EdgeInsets.only(right: 10.w),
                        child: TextButton(
                          style: ButtonStyle(
                            shape: WidgetStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.r),
                                    side:  BorderSide(color: Theme.of(context).colorScheme.secondary,width: 2.w))),
                            backgroundColor:
                            state is GenderSelectedState && state.gender == genderList[index]
                                ? WidgetStateProperty.all<Color>(Theme.of(context).colorScheme.secondary)
                                : WidgetStateProperty.all<Color>(Colors.white),
                            foregroundColor:
                            state is GenderSelectedState && state.gender == genderList[index]
                                ? WidgetStateProperty
                                .all<Color>(Colors.white)
                                : WidgetStateProperty.all<Color>(Theme.of(context).colorScheme.secondary),
                          ),
                          onPressed: () {
                            gender=genderList[index];
                            context.read<DrawerCubit>().genderSelected(gender);
                          },
                          child: Text(
                            genderList[index],
                            style:TextStyle(fontSize: 17.sp),
                          ),
                        ),
                      );
                    }),
                    );
                  },
                ),
            ),

            SizedBox(
              height: 10.h,
            ),

            Padding(
              padding: EdgeInsets.all(17),
              child: Text(
                "Age",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20.sp,
                  color: Theme.of(context).colorScheme.secondary),
              ),
            ),

            Wrap(
              children: [
                 SizedBox(
                  width: 15.w,
                ),
                SizedBox(
                  width: 140.w,
                  height: 50.h,
                  child: TextFormField(
                    controller: minAgeController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black),
                    decoration:  InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFF2F4F7),
                      hintText: "from",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.r)),
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.r)),
                          borderSide: BorderSide(color: Colors.white)),
                    ),
                  ),
                ),

                SizedBox(
                  width: 10.h,
                ),

                SizedBox(
                  width: 140.w,
                  height: 50.h,
                  child: TextFormField(
                    controller: maxAgeController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Theme.of(context).colorScheme.inverseSurface,
                      hintText: "to",
                      enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(color: Colors.white)),
                    ),
                  ),
                ),
              ],
            ),

             SizedBox(
              height: 10.h,
            ),

            Padding(
              padding: EdgeInsets.all(17),
              child: Text(
                "Tooth number",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20.sp,
                  color: Theme.of(context).colorScheme.secondary),
            ),
            ),

            Padding(
              padding:
              EdgeInsets.only(left: 15.w,right: 10.w),
              child:Container(width: 266.w,
                child:TextFormField(
                controller: toothNumController,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: "enter number",
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.inverseSurface,
                  enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide:
                      BorderSide(color: Colors.white)),
                ),
              ),
              )

            ),

            Padding(
              padding: EdgeInsets.only(top: 50),
              child: Center(
                child: SizedBox(
                  width: 150.w,
                  height: 40.h,
                  child: TextButton(
                    onPressed: () async {
                      minAge = minAgeController.text.isNotEmpty ? int.parse(minAgeController.text.toString()) : 0;
                      maxAge = maxAgeController.text.isNotEmpty ? int.parse(maxAgeController.text.toString()) : 200;
                      toothNum = toothNumController.text.isNotEmpty ? int.parse(toothNumController.text.toString()) : "all";
                      context.read<PatientListCubit>().applyFilter(diseaseName:treatmentType ,gender: gender,minAge: minAge,maxAge: maxAge,toothNumber: toothNum);
                    },
                    style: ButtonStyle(
                      shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0), side: BorderSide(color: Theme.of(context).colorScheme.secondary),),),
                      backgroundColor: WidgetStateProperty.all<Color>(Theme.of(context).colorScheme.secondary),
                    ),
                    child:  Text(
                      "Apply",
                      style: TextStyle(
                        fontSize: 17.sp,
                        color: Colors.white),),
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );

  }
}
