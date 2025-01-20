import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());

// Increase the number by one and emit the new value
  void increment(int number) {
    if (number == 10) return emit(CounterMaxState(msg: 'increment'));
    emit(CounterValueState(value: number + 1));
  }

// Decrease the number by one and emit the new value
  void decrement(int number) {
    if (number == -10) return emit(CounterMaxState(msg: 'decrement'));
    if (number == 0) emit(CounterNegativeState());
    emit(CounterValueState(value: number - 1));
  }
}
