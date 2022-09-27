import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              const Text("HGGGJG"),
              TextButton(
                onPressed: () {},
                child: Text("Fetch"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
