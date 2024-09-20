import 'package:bloc/bloc.dart';
import 'package:diente/student/presentation/bloc/student_bloc_event.dart';
import 'package:diente/student/presentation/bloc/student_bloc_state.dart';
import 'package:meta/meta.dart';



class StudentBlocBloc extends Bloc<StudentBlocEvent, StudentBlocState> {
  StudentBlocBloc() : super(StudentBlocInitial()) {
    on<StudentBlocEvent>((event, emit) {
      // TODO: implement event handler
      
    });
  }
}
