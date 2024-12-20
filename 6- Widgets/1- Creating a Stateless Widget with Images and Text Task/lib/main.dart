import 'package:first_flutter_project/core/utils/size_config.dart';
import 'package:first_flutter_project/presentation/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter BootCamp',
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.blue[900]),
        fontFamily: 'Suwannaphum',
      ),
      home: const HomePage(),
    );
  }
}
