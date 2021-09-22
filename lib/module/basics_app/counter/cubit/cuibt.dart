import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/module/basics_app/counter/cubit/states.dart';

class CounterCubit extends Cubit<CounterStates> {
  CounterCubit() : super(CounterInitialState());

  // to be more easily when using this cubit in many places
  static CounterCubit get(context) {
    return BlocProvider.of(context);
  }

  int counter = 1;

  void minus() {
    counter--;
    emit(CounterMinusState(counter: counter));
  }

  void plus() {
    counter++;
    emit(CounterPlusState(counter: counter));
  }
}
