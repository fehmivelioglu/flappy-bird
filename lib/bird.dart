import 'package:flutter/material.dart';

class MyBird extends StatelessWidget {
  const MyBird({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/bird.png',height: 60,width: 60,
    );
  }
}