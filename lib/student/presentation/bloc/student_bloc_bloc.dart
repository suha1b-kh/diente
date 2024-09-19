import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'student_bloc_event.dart';
part 'student_bloc_state.dart';

class StudentBlocBloc extends Bloc<StudentBlocEvent, StudentBlocState> {
  StudentBlocBloc() : super(StudentBlocInitial()) {
    on<StudentBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
