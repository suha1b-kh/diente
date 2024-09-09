import 'package:diente/auth/data/models/user.dart';
import 'package:diente/auth/data/source/auth_firebase_service.dart';

import 'package:diente/auth/presentation/bloc/login_bloc/bloc/login_event.dart';
import 'package:diente/auth/presentation/bloc/login_bloc/bloc/login_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthFirebaseService authService = AuthFirebaseService();

  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {});

    on<SubmitLogin>((event, emit) async {
      // Emit loading state
      emit(const LoginLoading(isLoading: true));

      try {
        // Try to sign up the user
        final UserModel? user =
            await authService.login(event.email, event.password);

        if (user != null) {
          // If Login is successful, emit success state
          emit(LoginSuccess(user: user));
        } else {
          // If user creation fails, emit failure state
          emit(const LoginFailure('Create user failed'));
        }
      } catch (e) {
        // Catch any errors and emit failure state
        emit(LoginFailure(e.toString()));
      } finally {
        // This is optional, but you can stop the loading state here
        // if you need to reflect that the process is done.
        emit(const LoginLoading(isLoading: false));
      }
    });
  }
}
