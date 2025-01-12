part of 'counter_cubit.dart';

@immutable
abstract class CounterState {}

class CounterInitial extends CounterState {}

// Create a state for the value
class CounterValueState extends CounterState {
  final int value;

  CounterValueState({required this.value});
}

// Create state for negative value
class CounterNegativeState extends CounterState {}

// Create a state for max value
class CounterMaxState extends CounterState {
  final String msg;

  CounterMaxState({required this.msg});
}
