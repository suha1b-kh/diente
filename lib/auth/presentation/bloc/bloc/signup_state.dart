import 'package:diente/auth/data/models/user.dart';

abstract class SignupState {
  const SignupState();
  List<Object> get props => [];
}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {
  final bool isLoading;

  SignupLoading({required this.isLoading});
}

class SignupSuccess extends SignupState {
  final UserModel user;

  SignupSuccess({required this.user});
  @override
  List<Object> get props => [user];
}

class SignupFailure extends SignupState {
  final String error;

  SignupFailure(this.error);

  @override
  List<Object> get props => [error];
}
