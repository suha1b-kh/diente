abstract class StudentLoginEvent {
  const StudentLoginEvent();

  List<Object> get props => [];
}

class StudentSubmitLogin extends StudentLoginEvent {
  final String email;
  final String password;

  StudentSubmitLogin({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}
