import 'package:diente/student/profile/widgets/enum.dart';
import 'package:diente/student/profile/widgets/search_bar.dart';
import 'package:diente/student/profile/widgets/student_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../filter-bloc/filter_cubit.dart';
import '../../filter-bloc/patient_list_cubit.dart';
import '../widgets/Drawer.dart';

class HomeStudentScreen extends StatelessWidget {
  HomeStudentScreen({super.key,});
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context){
    return BlocProvider(
        create:(BuildContext context)=>PatientListCubit(),
    child:
      Scaffold(
      key: scaffoldKey,
      appBar: AppBar(title: const StudentAppbar(),
          // actions: [IconButton(
          //   icon: Icon(Icons.filter_alt),
          //   onPressed: () => Scaffold.of(context).openEndDrawer
          // ),]
      ),

      endDrawer: Drawer(
        child:BlocProvider(
          create:(BuildContext context)=>DrawerCubit(),
          child: const CustomDrawer()
          ) ,
        ),

      body: ListView(
        children: [
          Column(
            children: [
              // Gap(29.h),
              // SearchStudentBar(scaffoldKey),
              Gap(34.h),
              BlocBuilder<PatientListCubit, PatientListState>(
              builder: (BuildContext context,
              PatientListState state) {
                if(state is FilterState) {
                  return ListWidgets(
                    widgetType: WidgetType.patient,
                    diseaseName: state.diseaseName,
                    gender: state.gender,
                    minAge:state.minAge,
                    maxAge: state.maxAge,
                    toothNumber:state.toothNumber,
                  );
                } else {
                  return ListWidgets(
                    widgetType: WidgetType.patient
                  );
                }
              }
               )
            ],
          ),
        ],
      ),
    ),
    );
  }
}
