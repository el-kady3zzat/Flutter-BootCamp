import 'package:first_flutter_project/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class SnaporaButton extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final void Function()? onPress;
  const SnaporaButton(
      {super.key,
      required this.text,
      required this.onPress,
      required this.width,
      required this.height});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPress,
      color: Colors.blue[900],
      textColor: Colors.white,
      minWidth: SizeConfig.defaultSize! * width,
      padding: EdgeInsets.symmetric(vertical: height, horizontal: width),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: width),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
