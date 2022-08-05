import 'package:flutter/material.dart';

class MyBarrier extends StatelessWidget {
  const MyBarrier(this.size, {Key? key}) : super(key: key);
  final double size;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: size,
      decoration: BoxDecoration(
          color: Colors.green,
          border: Border.all(width: 10),
          borderRadius: BorderRadius.circular(10)),
    );
  }
}
