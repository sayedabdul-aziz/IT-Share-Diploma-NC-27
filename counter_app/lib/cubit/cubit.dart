import 'package:counter_app/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterStates> {
  CounterCubit() : super(CounterInitial());

  int counter = 0;

  void add() {
    counter++;
    emit(UpdateTextCounter());
  }

  void remove() {
    counter--;
    emit(UpdateTextCounter());
  }
}
