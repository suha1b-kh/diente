import 'package:diente/auth/data/models/user.dart';
import 'package:diente/auth/data/source/auth_firebase_service.dart';
import 'package:diente/auth/presentation/bloc/bloc/signup_event.dart';
import 'package:diente/auth/presentation/bloc/bloc/signup_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class SignupBloc extends Bloc<SignUpEvent, SignupState> {
  final AuthFirebaseService authService = AuthFirebaseService();

  SignupBloc() : super(SignupInitial()) {
    on<SignUpEvent>((event, emit) {});

    on<SubmitSignup>((event, emit) async {
      // Emit loading state
      emit(SignupLoading(isLoading: true));

      try {
        // Try to sign up the user
        final UserModel? user =
            await authService.signup(event.email, event.password);

        if (user != null) {
          // If signup is successful, emit success state
          emit(SignupSuccess(user: user));
        } else {
          // If user creation fails, emit failure state
          emit(SignupFailure('Create user failed'));
        }
      } catch (e) {
        // Catch any errors and emit failure state
        emit(SignupFailure(e.toString()));
      } finally {
        // This is optional, but you can stop the loading state here
        // if you need to reflect that the process is done.
        emit(SignupLoading(isLoading: false));
      }
    });
  }
}
