import 'package:flutter/material.dart';

class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Hello 4",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
        ),
      ),
    );
  }
}
