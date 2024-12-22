import 'package:first_flutter_project/core/utils/size_config.dart';
import 'package:first_flutter_project/core/widgets/button.dart';
import 'package:first_flutter_project/core/widgets/logo.dart';
import 'package:first_flutter_project/core/widgets/text_field.dart';
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
                hint: 'Enter your name',
                icon: Icons.person,
                fieldKey: nameKey,
              ),
              //
              _space(2),
              //
              SnaporaTextField(
                controller: emailController,
                hint: 'Enter your email',
                icon: Icons.email,
                fieldKey: emailKey,
              ),
              //
              _space(2),
              //
              SnaporaTextField(
                controller: passController,
                hint: 'Enter your password',
                icon: Icons.lock,
                fieldKey: passKey,
              ),
              //
              _space(2),
              //
              SnaporaTextField(
                controller: confirmPassController,
                hint: 'Confirm your password',
                icon: Icons.lock,
                fieldKey: confirmPassKey,
              ),
              //
              _space(4),
              //
              SnaporaButton(
                text: 'Sign Up',
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
          title: Text('Welcome ${getFirstName(nameController.text)}!'),
          content: const Text(
            'Account Created Successfully',
            textAlign: TextAlign.center,
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('shopping', (route) => false);
              },
              child: const Text('Thanks'),
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
          content: const Text(
            'Password do not match',
            style: TextStyle(fontSize: 16),
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
