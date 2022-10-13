import 'package:flutter/material.dart';

class FevoriteScreen extends StatefulWidget {
  const FevoriteScreen({Key? key}) : super(key: key);

  @override
  State<FevoriteScreen> createState() => _FevoriteScreenState();
}

class _FevoriteScreenState extends State<FevoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios_new, color: Colors.black)),
        centerTitle: true,
        title: const Text("Daily Update News 24/7",
            style: TextStyle(color: Colors.black)),
      ),
      backgroundColor: Colors.white70,
    ));
  }
}
