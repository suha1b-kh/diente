import 'package:diente/auth/data/models/user.dart';

abstract class SignUpState {
  const SignUpState();
  List<Object> get props => [];
}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {
  final bool isLoading;

  SignUpLoading({required this.isLoading});
}

class SignUpSuccess extends SignUpState {
  final UserModel user;

  SignUpSuccess({required this.user});
  @override
  List<Object> get props => [user];
}

class SignUpFailure extends SignUpState {
  final String error;

  SignUpFailure(this.error);

  @override
  List<Object> get props => [error];
}

// abstract class ProfileState {}

// class ProfileInitial extends ProfileState {}

// class ProfileLoading extends ProfileState {}

// class ProfileSuccess extends ProfileState {}

// class ProfileFailure extends ProfileState {
//   final String error;

//   ProfileFailure(this.error);
// }
