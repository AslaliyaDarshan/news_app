import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/view/screen/newsModel.dart';

class HomeProvider extends ChangeNotifier {
  String Data = "gujarat news";

  void changeData(String dataLink) {
    Data = dataLink;
    notifyListeners();
  }

  Articles? model;

  Future<NewsModel> apiHelper(String data) async {
    String apiLink =
        "https://newsapi.org/v2/everything?q=$data&apiKey=010513136ca8427f83fa7aaf4a412cd8";
    var apiParsing = await http.get(Uri.parse(apiLink));
    var json = jsonDecode(apiParsing.body);
    return NewsModel.fromJson(json);
  }
}
