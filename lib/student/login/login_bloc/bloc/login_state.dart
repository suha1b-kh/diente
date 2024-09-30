import 'package:diente/student/data/models/student.dart';
import 'package:equatable/equatable.dart';

abstract class StudentLoginState extends Equatable {
  const StudentLoginState();
  @override
  List<Object> get props => [];
}

class StudentLoginInitial extends StudentLoginState {}

class StudentLoginLoading extends StudentLoginState {
  final bool isLoading;

  const StudentLoginLoading({required this.isLoading});
}

class StudentLoginSuccess extends StudentLoginState {
  final StudentModel user;

  const StudentLoginSuccess({required this.user});
  @override
  List<Object> get props => [user];
}

class StudentLoginFailure extends StudentLoginState {
  final String error;

  const StudentLoginFailure(this.error);

  @override
  List<Object> get props => [error];
}
