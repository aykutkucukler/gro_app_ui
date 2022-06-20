import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
          child: SizedBox(
            width: 100,
            height: 100,
            child: Text("Home Screen"),
          ),
        )
      ]),
    );
  }
}