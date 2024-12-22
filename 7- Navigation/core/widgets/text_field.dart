import 'package:first_flutter_project/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class SnaporaTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final GlobalKey<FormFieldState> fieldKey;
  const SnaporaTextField(
      {super.key,
      required this.controller,
      required this.hint,
      required this.icon,
      required this.fieldKey});

  @override
  State<SnaporaTextField> createState() => _SnaporaTextFieldState();
}

class _SnaporaTextFieldState extends State<SnaporaTextField> {
  bool _isPasswordVisible = false;
  //
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        key: widget.fieldKey,
        controller: widget.controller,
        style: const TextStyle(color: Colors.white),
        validator: (value) => validation(value),
        cursorColor: Colors.blue[900],
        obscureText:
            widget.hint.contains('password') ? !_isPasswordVisible : false,
        keyboardType: widget.hint.contains('email')
            ? TextInputType.emailAddress
            : TextInputType.text,
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(vertical: SizeConfig.screenHeight! * 0.02),
          enabledBorder: border(),
          focusedBorder: border(),
          border: border(),
          filled: true,
          fillColor: Colors.blue[500],
          prefixIcon: Icon(
            widget.icon,
            color: Colors.blue[900],
          ),
          hintText: widget.hint,
          suffixIcon: widget.hint.contains('password') ? suffix() : null,
        ),
        onChanged: (value) => onChange(),
      ),
    );
  }

  String? validation(String? value) {
    if (value!.isEmpty) {
      return 'Required Field';
    }
    if (widget.hint.contains('name') && !value.startsWith(RegExp(r'[A-Z]'))) {
      return 'Must start with capital letter';
    }
    if (widget.hint.contains('email') && !value.contains('@')) {
      return 'Doesn\'t look like a valid email';
    }
    if (widget.hint.contains('pass')) {
      return passValidation(value);
    }
    return null;
  }

  String? passValidation(String pass) {
    // At least 8 characters
    if (pass.length < 8) {
      return 'Enter at least 8 characters';
    }
    // Contains at least one uppercase letter
    if (!RegExp(r'[A-Z]').hasMatch(pass)) {
      return 'Enter at least one uppercase letter';
    }
    // Contains at least one lowercase letter
    if (!RegExp(r'[a-z]').hasMatch(pass)) {
      return 'Enter at least one lowercase letter';
    }
    // Contains at least one number
    if (!RegExp(r'\d').hasMatch(pass)) {
      return 'Enter at least one number';
    }
    // Contains at least one special character
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(pass)) {
      return 'Enter at least one special character';
    }

    return null;
  }

  void onChange() {
    widget.fieldKey.currentState!.validate();
  }

  OutlineInputBorder border() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(20),
    );
  }

  Widget suffix() {
    return IconButton(
      icon: Icon(_isPasswordVisible
          ? Icons.visibility
          : Icons.visibility_off_outlined),
      color: Colors.blue[900],
      onPressed: () {
        setState(() {
          _isPasswordVisible = !_isPasswordVisible;
        });
      },
    );
  }
}
