import 'package:easy_localization/easy_localization.dart';
import 'package:first_flutter_project/core/utils/size_config.dart';
import 'package:first_flutter_project/presentation/auth/signup_page.dart';
import 'package:first_flutter_project/presentation/home_page.dart';
import 'package:first_flutter_project/presentation/shopping_page.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the SizeConfig class to adapt the app to various screen sizes.
    SizeConfig().init(context);

    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,

      // Removes the "debug" banner from the top-right corner of the app.
      debugShowCheckedModeBanner: false,

      // The title of the app.
      title: 'Flutter BootCamp',

      theme: ThemeData(
        // Sets the color of the AppBar in the app's theme.
        appBarTheme: AppBarTheme(color: Colors.blue[900]),

        // Specifies the default font family for the app.
        fontFamily: 'Suwannaphum',
        textTheme: TextTheme(
          displayMedium: TextStyle(
            fontSize: 20, // Sets the font size.
            fontWeight: FontWeight.bold, // Makes the text bold.
            color: Colors.blue[900], // Sets the text color to dark blue.
          ),
        ),
      ),

      // Sets the initial screen of the app to be the HomePage widget.
      home: const SignupPage(),
      routes: {
        'signup': (context) => const SignupPage(),
        'home': (context) => const HomePage(),
        'shopping': (context) => const ShoppingPage(),
      },
    );
  }
}
