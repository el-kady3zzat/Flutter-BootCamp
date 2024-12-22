import 'package:first_flutter_project/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class SnaporaLogo extends StatelessWidget {
  final double imagePercent;
  const SnaporaLogo({super.key, required this.imagePercent});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Card(
            color: Colors.blue[900],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(1000),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/images/shopping_basket.png',
                height: SizeConfig.defaultSize! * imagePercent,
              ),
            ),
          ),
        ),
        //
        Text(
          'Snapora',
          style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.blue[900]),
        )
      ],
    );
  }
}
