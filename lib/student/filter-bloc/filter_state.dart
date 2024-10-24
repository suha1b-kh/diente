part of 'filter_cubit.dart';
//////////filter?////////////
@immutable
sealed class DrawerState {}

final class DrawerInitial extends DrawerState {}

final class GenderSelectedState extends DrawerState{
  dynamic gender;
  GenderSelectedState({this.gender});
}