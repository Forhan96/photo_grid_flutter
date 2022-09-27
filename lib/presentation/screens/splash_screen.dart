import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Icon(
          Icons.ac_unit_outlined,
          size: 56,
          color: Colors.green,
        ),
      ),
    );
  }
}
