import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'article.dart';

class News {
  List<Article> news = [];

  Future<List<Article>> fetchNews() async {
    String url =
        "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=724c976df9074928a7c346fbd6c7f438";
    final response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);
    print('$jsonData');
    if (response.statusCode == 200) {
      (jsonData as Map)["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          // ham fromJSON

          // viet ham truyen thong so json, return ve new article.
          // detail, tim object article , dung toJSON

          // fromJSON, toJSON
          var article = Article.fromJson(element);
          print('toJson: ${article.toJson()}');
          print('article: ${article.title}');
          news.add(article);
          print('news: $news');
        }
      });
      return this.news;
    } else {
      throw Exception("Failed to load API");
    }
  }
}
