import 'package:diente/student/data/models/student.dart';
import 'package:diente/student/data/services/student_login.dart';
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
  final Future<StudentModel> studentModelFuture =
      StudentServices().fetchStudent();

  HomeStudentScreen({super.key});
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => PatientListCubit(),
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: FutureBuilder<StudentModel>(
            future: StudentServices().fetchStudent(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData) {
                return StudentAppbar(student: snapshot.data!);
              } else {
                return const Text('No Data');
              }
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.filter_alt),
              onPressed: () => scaffoldKey.currentState?.openEndDrawer(),
            ),
          ],
        ),
        endDrawer: Drawer(
          child: BlocProvider(
            create: (BuildContext context) => DrawerCubit(),
            child: const CustomDrawer(),
          ),
        ),
        body: ListView(
          children: [
            Column(
              children: [
                Gap(34.h),
                BlocBuilder<PatientListCubit, PatientListState>(
                  builder: (BuildContext context, PatientListState state) {
                    if (state is FilterState) {
                      return ListWidgets(
                        widgetType: WidgetType.patient,
                        diseaseName: state.diseaseName,
                        gender: state.gender,
                        minAge: state.minAge,
                        maxAge: state.maxAge,
                        toothNumber: state.toothNumber,
                      );
                    } else {
                      return ListWidgets(
                        widgetType: WidgetType.patient,
                      );
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
