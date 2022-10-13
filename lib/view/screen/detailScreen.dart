import 'package:flutter/material.dart';
import 'package:news_app/provider/detailProvider.dart';
import 'package:news_app/provider/homeProvider.dart';
import 'package:news_app/view/widgetsScreen/size.dart';
import 'package:provider/provider.dart';

import '../../model/newsModel.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  HomeProvider? hTrue;
  HomeProvider? hFalse;

  @override
  Widget build(BuildContext context) {
    hTrue = Provider.of<HomeProvider>(context, listen: true);
    hFalse = Provider.of<HomeProvider>(context, listen: false);

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
        floatingActionButton: like(),
        backgroundColor: Colors.white70,
        body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
          children: [
            Text(
              "Author : ${hFalse!.model!.author}",
              maxLines: 5,
              style: const TextStyle(fontSize: 20, color: Colors.red),
            ),
            height(15),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Time: ${hFalse!.model!.publishedAt}",
                style: const TextStyle(fontSize: 20, color: Colors.blue),
              ),
            ),
            height(15),
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network("${hFalse!.model!.urlToImage}",
                  fit: BoxFit.cover, height: 400),
            ),
            Text(
              "${hFalse!.model!.title}",
              style: const TextStyle(fontSize: 30),
            ),
            height(10.0),
            Text(
              "${hFalse!.model!.description}",
              style: const TextStyle(fontSize: 20, color: Colors.black54),
            ),
            height(MediaQuery.of(context).size.height / 3),
            Container(
              height: 5,
              width: 100,
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.red,
                  Colors.purple,
                  Colors.blue,
                  Colors.pink
                ]),
              ),
            ),
            height(10),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'web',
                      arguments: hFalse!.model!.url);
                },
                child: Text(
                  "Get More Information",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.brown[800],
                      decoration: TextDecoration.underline),
                ),
              ),
            ),
            height(20),
          ],
        ),
      ),
    );
  }

  Widget like() {
    return Card(
      color: Colors.white70,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        height: 60,
        width: 60,
        child: InkWell(
          splashColor: Colors.red,
          borderRadius: BorderRadius.circular(15),
          onTap: () {
            Provider.of<DetailProvider>(context, listen: false).like();
          },
          child: Provider.of<DetailProvider>(context, listen: true).fevorite
              ? const Icon(
                  Icons.favorite_border,
                  color: Colors.red,
                )
              : const Icon(Icons.favorite, color: Colors.red),
        ),
      ),
    );
  }
}
