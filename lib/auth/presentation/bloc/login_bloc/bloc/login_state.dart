import 'package:diente/auth/data/models/user.dart';
import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState();
  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {
  final bool isLoading;

  const LoginLoading({required this.isLoading});
}

class LoginSuccess extends LoginState {
  final UserModel user;

  const LoginSuccess({required this.user});
  @override
  List<Object> get props => [user];
}

class LoginFailure extends LoginState {
  final String error;

  const LoginFailure(this.error);

  @override
  List<Object> get props => [error];
}
