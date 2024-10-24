part of 'patient_list_cubit.dart';

@immutable
sealed class PatientListState {

}

final class PatientListInitial extends PatientListState {}

final class FilterState extends PatientListState{
  dynamic diseaseName ;
  dynamic gender;
  dynamic maxAge ;
  dynamic minAge ;
  dynamic toothNumber;
FilterState({this.diseaseName,this.gender,this.minAge,this.maxAge,this.toothNumber});

}