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
      backgroundColor: Colors.white70,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/spleshImage/splesh.gif",
            fit: BoxFit.fill,
          ),
          Text(
            "  Daily Update          ",
            style: TextStyle(fontSize: 50),
          ),
          Text(
            "                 News 24/7",
            style: TextStyle(fontSize: 25, color: Colors.red),
          ),
        ],
      ),
    );
  }
}
