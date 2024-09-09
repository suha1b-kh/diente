import 'package:diente/auth/data/models/user.dart';

abstract class LoginEvent {
  const LoginEvent();

  List<Object> get props => [];
}

class SubmitLogin extends LoginEvent {
  final String email;
  final String password;

  SubmitLogin({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}
