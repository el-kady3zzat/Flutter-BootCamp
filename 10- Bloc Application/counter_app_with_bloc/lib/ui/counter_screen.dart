import 'package:counter_app_with_bloc/counter_cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

// Use BlocConsumer to track the states and update the UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state is CounterMaxState) {
                  _showDialog(context, state.msg);
                }
                if (state is CounterNegativeState) {
                  _showDialog(context, 'Counter is negative!');
                }
              },
              builder: (context, state) {
                int number = 0;
                if (state is CounterValueState) number = state.value;
                return _body(context, number);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _body(BuildContext context, int number) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _numberTxt(number),
        _btns(context, number),
      ],
    );
  }

  Widget _numberTxt(int number) {
    return Text(
      '$number',
      style: TextStyle(fontSize: 44, fontWeight: FontWeight.bold),
    );
  }

  Widget _btns(BuildContext context, int number) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          onPressed: () {
            context.read<CounterCubit>().decrement(number);
          },
          child: Text('-', style: TextStyle(fontSize: 34)),
        ),
        ElevatedButton(
          onPressed: () {
            context.read<CounterCubit>().increment(number);
          },
          child: Text('+', style: TextStyle(fontSize: 34)),
        ),
      ],
    );
  }

  void _showDialog(BuildContext context, String msg) {
    msg == 'increment'
        ? msg = '10'
        : msg == 'decrement'
            ? msg = '-10'
            : msg;
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) => AlertDialog(
        title:
            msg.contains('10') ? Text('Limit Reached') : Text('Negative Value'),
        content: msg.contains('10')
            ? Text('You reached: $msg')
            : Text('Negative Value Reached'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}
