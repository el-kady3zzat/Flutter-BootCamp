import 'package:create_different_blocs/counter_cubit/counter_cubit.dart';
import 'package:create_different_blocs/theme_cubit/theme_cubit.dart';
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
                  _showSnackbar(context, state.msg);
                }
                if (state is CounterNegativeState) {
                  _showSnackbar(context, 'Counter is negative!');
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
        SizedBox(height: 100),
        _theme(context),
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

  Widget _theme(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          onPressed: () {
            context.read<ThemeCubit>().setLightTheme(context);
          },
          icon: Icon(Icons.light_mode_rounded),
          iconSize: 50,
          highlightColor: Colors.green,
        ),
        IconButton(
          onPressed: () {
            context.read<ThemeCubit>().setDarkTheme(context);
          },
          icon: Icon(Icons.dark_mode_rounded),
          iconSize: 50,
          highlightColor: Colors.green,
        ),
      ],
    );
  }

  void _showSnackbar(BuildContext context, String msg) {
    msg == 'increment'
        ? msg = '10'
        : msg == 'decrement'
            ? msg = '-10'
            : msg;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: msg.contains('10')
            ? Text('You reached: $msg')
            : Text('Negative Value Reached'),
      ),
    );
  }
}
