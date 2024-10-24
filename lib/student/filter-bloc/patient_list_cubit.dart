import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:diente/student/data/models/case.dart';
import 'package:meta/meta.dart';

import '../data/services/cases_filter.dart';

part 'patient_list_state.dart';

class PatientListCubit extends Cubit<PatientListState> {

  PatientListCubit() : super(PatientListInitial());


  void applyFilter({diseaseName, gender, toothNumber, maxAge, minAge}) async {

    emit(FilterState(diseaseName:diseaseName, gender:gender,minAge:minAge,maxAge: maxAge,toothNumber: toothNumber));
  }

}
