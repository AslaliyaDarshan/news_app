import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/provider/homeProvider.dart';
import 'package:news_app/view/screen/newsModel.dart';
import 'package:news_app/view/widgetsScreen/size.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? hTrue;
  HomeProvider? hFalse;
  TextEditingController txtSearch = TextEditingController(text: "politics");

  @override
  Widget build(BuildContext context) {
    hTrue = Provider.of<HomeProvider>(context, listen: true);
    hFalse = Provider.of<HomeProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white70,
          title: const Text("Daily Updated News 24/7",
              style: TextStyle(color: Colors.black)),
        ),
        backgroundColor: Colors.white70,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blueGrey.shade500,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                  onSubmitted: (text) {
                    hFalse!.changeData(text);
                  },
                  controller: txtSearch,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      filled: true,
                      hintText: "politics"),
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder<NewsModel>(
                future: hTrue!.apiHelper(hTrue!.Data),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  } else if (snapshot.hasData) {
                    NewsModel newsModel = snapshot.data!;
                    return ListView.builder(
                      itemCount: newsModel.articles!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 3, vertical: 18),
                          child: GestureDetector(
                            onTap: () {
                              hFalse!.model = Articles(
                                  url: newsModel.articles![index].url,
                                  title: newsModel.articles![index].title,
                                  description:
                                      newsModel.articles![index].description,
                                  author: newsModel.articles![index].author,
                                  content: newsModel.articles![index].content,
                                  publishedAt:
                                      newsModel.articles![index].publishedAt,
                                  source: newsModel.articles![index].source,
                                  urlToImage:
                                      newsModel.articles![index].urlToImage);
                              Navigator.pushNamed(context, 'detail');
                            },
                            child: Stack(
                              alignment: const Alignment(0, 1.3),
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 20),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          "${newsModel.articles![index].urlToImage}",
                                      placeholder: (context, url) => ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.network(
                                            "https://previews.123rf.com/images/ratoca/ratoca1412/ratoca141200238/34983661-loading-message.jpg"),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 7),
                                  height: 110,
                                  width: double.maxFinite,
                                  decoration: BoxDecoration(
                                      color: Colors.blueGrey,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: ListView(
                                    children: [
                                      AutoSizeText(
                                        "${newsModel.articles![index].title}",
                                        style: const TextStyle(fontSize: 25),
                                      ),
                                      height(3),
                                      AutoSizeText(
                                        "${newsModel.articles![index].description}",
                                        style: const TextStyle(fontSize: 17),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.red,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
