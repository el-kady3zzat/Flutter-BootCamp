import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:create_different_blocs/counter_cubit/counter_cubit.dart';
import 'package:create_different_blocs/theme_cubit/theme_cubit.dart';
import 'package:create_different_blocs/ui/counter_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
        light: ThemeData.light(),
        dark: ThemeData.dark(),
        initial: AdaptiveThemeMode.dark,
        builder: (light, dark) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => ThemeCubit()),
              BlocProvider(create: (context) => CounterCubit()),
            ],
            child: MaterialApp(
              theme: light,
              darkTheme: dark,
              debugShowCheckedModeBanner: false,
              home: CounterScreen(),
            ),
          );
        });
  }
}
