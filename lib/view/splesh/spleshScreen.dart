import 'dart:async';

import 'package:flutter/material.dart';

class SpleshScreen extends StatefulWidget {
  const SpleshScreen({Key? key}) : super(key: key);

  @override
  State<SpleshScreen> createState() => _SpleshScreenState();
}

class _SpleshScreenState extends State<SpleshScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 5),
      () {
        Navigator.pushReplacementNamed(context, 'home');
      },
    );
    return Scaffold(
        backgroundColor: Colors.black26,
        body: Center(
          child: Image.asset(
            "assets/spleshImage/splesh.png",
            fit: BoxFit.fill,
          ),
        ));
  }
}
