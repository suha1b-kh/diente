import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'filter_state.dart';

class DrawerCubit extends Cubit<DrawerState> {

  DrawerCubit() : super(DrawerInitial());

  void genderSelected(String val)=>emit(GenderSelectedState(gender: val));


}
