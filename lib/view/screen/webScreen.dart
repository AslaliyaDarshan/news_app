import 'package:flutter/material.dart';
import 'package:news_app/provider/homeProvider.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebScreen extends StatefulWidget {
  const WebScreen({Key? key}) : super(key: key);

  @override
  State<WebScreen> createState() => _WebScreenState();
}

class _WebScreenState extends State<WebScreen> {
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
      body: WebView(
        initialUrl:
            "${Provider.of<HomeProvider>(context, listen: true).model!.url}",
      ),
    ));
  }
}
