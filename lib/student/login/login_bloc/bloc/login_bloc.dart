import 'package:diente/student/data/models/student.dart';
import 'package:diente/student/login/login_bloc/bloc/login_event.dart';
import 'package:diente/student/login/login_bloc/bloc/login_state.dart';
import 'package:diente/student/login/services/student_login_services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class StudentLoginBloc extends Bloc<StudentLoginEvent, StudentLoginState> {
  final StudentAuthFirebaseServices authService = StudentAuthFirebaseServices();

  StudentLoginBloc() : super(StudentLoginInitial()) {
    on<StudentLoginEvent>((event, emit) {});

    on<StudentSubmitLogin>((event, emit) async {
      // Emit loading state
      emit(const StudentLoginLoading(isLoading: true));

      try {
        // Try to sign up the user
        final StudentModel? user =
            await authService.login(event.email, event.password);
        if (user != null) {
          // If Login is successful, emit success state
          emit(StudentLoginSuccess(user: user));
        } else {
          // If user creation fails, emit failure state
          emit(const StudentLoginFailure('login user failed'));
        }
      } catch (e) {
        // Catch any errors and emit failure state
        emit(StudentLoginFailure(e.toString()));
      } finally {
        // This is optional, but you can stop the loading state here
        // if you need to reflect that the process is done.
        emit(const StudentLoginLoading(isLoading: false));
      }
    });
  }
}
