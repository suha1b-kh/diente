import 'package:diente/auth/data/models/user.dart';

abstract class SignUpEvent {
  const SignUpEvent();

  List<Object> get props => [];
}

class SubmitSignup extends SignUpEvent {
  final String email;
  final String password;

  SubmitSignup({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

// abstract class ProfileEvent {}

// class SubmitProfile extends ProfileEvent {
//   final String fullName;
//   final String nationalId;
//   final String age;
//   final String gender;
//   final String phoneNumber;
//   final List<Map<String, bool>> medicalHistory;

//   SubmitProfile({
//     required this.fullName,
//     required this.nationalId,
//     required this.age,
//     required this.gender,
//     required this.phoneNumber,
//     required this.medicalHistory,
//   });
// }