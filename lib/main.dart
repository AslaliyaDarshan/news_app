import 'package:flutter/material.dart';
import 'package:news_app/provider/homeProvider.dart';
import 'package:news_app/view/screen/detailScreen.dart';
import 'package:news_app/view/screen/homeScreen.dart';
import 'package:news_app/view/screen/webScreen.dart';
import 'package:news_app/view/splesh/spleshScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeProvider>(
          create: (context) => HomeProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SpleshScreen(),
          'home': (context) => const HomeScreen(),
          'detail': (context) => const DetailScreen(),
          'web': (context) => const WebScreen(),
        },
      ),
    ),
  );
}
