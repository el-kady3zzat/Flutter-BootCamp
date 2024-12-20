import 'package:first_flutter_project/core/utils/size_config.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My First Project',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _imgs(),
          _space(5),
          _txt(),
        ],
      ),
    );
  }

  Widget _imgs() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          'assets/images/img1.jpg',
          width: SizeConfig.defaultSize! * 15,
          height: SizeConfig.defaultSize! * 15,
        ),
        Image.network(
          'https://picsum.photos/150',
          width: SizeConfig.defaultSize! * 15,
          height: SizeConfig.defaultSize! * 15,
        ),
      ],
    );
  }

  Widget _space(double space) {
    return SizedBox(height: SizeConfig.defaultSize! * space);
  }

  Widget _txt() {
    return Text(
      'The two images are displayed',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.blue[900],
      ),
    );
  }
}
