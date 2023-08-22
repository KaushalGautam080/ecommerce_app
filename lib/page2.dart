import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Hello 2",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
        ),
      ),
    );
  }
}
