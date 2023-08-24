import 'package:flutter/material.dart';

class CustomCartContainer extends StatefulWidget {
  final String title;
  final String price;
  final String quantity;
  const CustomCartContainer({
    Key? key,
    required this.price,
    required this.title,
    required this.quantity,
  }) : super(key: key);

  @override
  State<CustomCartContainer> createState() => _CustomCartContainerState();
}

class _CustomCartContainerState extends State<CustomCartContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.yellow,
        border: Border.all(color: Colors.black87),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.quantity),
              Text(widget.price),
            ],
          ),
        ],
      ),
    );
  }
}
