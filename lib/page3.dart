import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Hello 3",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
        ),
      ),
    );
  }
}
