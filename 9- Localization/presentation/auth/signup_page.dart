import 'package:easy_localization/easy_localization.dart';
import 'package:first_flutter_project/core/utils/size_config.dart';
import 'package:first_flutter_project/core/widgets/button.dart';
import 'package:first_flutter_project/core/widgets/logo.dart';
import 'package:first_flutter_project/core/widgets/text_field.dart';
import 'package:first_flutter_project/presentation/shopping_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
  //
  final GlobalKey<FormFieldState> nameKey = GlobalKey();
  final GlobalKey<FormFieldState> emailKey = GlobalKey();
  final GlobalKey<FormFieldState> passKey = GlobalKey();
  final GlobalKey<FormFieldState> confirmPassKey = GlobalKey();
  //
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.blue[900],
      statusBarIconBrightness: Brightness.light,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: signupFormKey,
      child: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SnaporaLogo(imagePercent: 10),
              //
              _space(6),
              //
              SnaporaTextField(
                controller: nameController,
                hint: 'enter_your_name'.tr(),
                icon: Icons.person,
                fieldKey: nameKey,
              ),
              //
              _space(2),
              //
              SnaporaTextField(
                controller: emailController,
                hint: 'enter_your_email'.tr(),
                icon: Icons.email,
                fieldKey: emailKey,
              ),
              //
              _space(2),
              //
              SnaporaTextField(
                controller: passController,
                hint: 'enter_your_password'.tr(),
                icon: Icons.lock,
                fieldKey: passKey,
              ),
              //
              _space(2),
              //
              SnaporaTextField(
                controller: confirmPassController,
                hint: 'confirm_your_password'.tr(),
                icon: Icons.lock,
                fieldKey: confirmPassKey,
              ),
              //
              _space(4),
              //
              SnaporaButton(
                text: 'sign_up'.tr(),
                onPress: () {
                  if (signupFormKey.currentState!.validate()) {
                    passController.text == confirmPassController.text
                        ? dialog()
                        : snackbar();
                  }
                },
                width: 20,
                height: 15.5,
              ),
              //
              _space(6),
            ],
          ),
        ],
      ),
    ));
  }

  dialog() {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title:
              Text('${'welcome'.tr()} ${getFirstName(nameController.text)}!'),
          content: Text(
            'account_created_successfully'.tr(),
            textAlign: TextAlign.center,
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushAndRemoveUntil(_createFadeRoute(), (route) => false);
              },
              child: Text('thanks'.tr()),
            ),
          ],
        );
      },
    );
  }

  String getFirstName(String name) {
    return name.contains(' ') ? name.substring(0, name.indexOf(' ')) : name;
  }

  snackbar() {
    return ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(
            'password_do_not_match'.tr(),
            style: const TextStyle(fontSize: 16),
          ),
          backgroundColor: Colors.blue[900],
          duration: const Duration(seconds: 3),
        ),
      );
  }

  Widget _space(double space) {
    return SizedBox(height: SizeConfig.defaultSize! * space);
  }
}

Route _createFadeRoute() {
  return PageRouteBuilder(
    // Defining the widget/page that will be displayed
    pageBuilder: (context, animation1, animation2) => const ShoppingPage(),

    // Sets the duration of the transition animation
    transitionDuration: const Duration(seconds: 3),

    // Defining how the transition animation between the pages will look
    transitionsBuilder: (context, animation1, animation2, child) {
      // Defining the range of the animation (from 0.0 to 1.0).
      const begin = 0.0;
      const end = 1.0;

      // Defines the curve for the animation
      const curve = Curves.easeIn;

      // Combines the tween with the curve for a smoother transition
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      // Drives the animation using the tween
      var fadeAnimation = animation1.drive(tween);

      // Applies the fade effect by wrapping the target child in a FadeTransition widget
      return FadeTransition(
        opacity:
            fadeAnimation, // Animates the opacity based on the fadeAnimation
        child: child, // The widget to which the fade effect is applied.
      );
    },
  );
}
