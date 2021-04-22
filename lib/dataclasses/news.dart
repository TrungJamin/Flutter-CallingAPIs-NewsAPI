import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'article.dart';

class News {
  List<Article> news = [];

  Future<void> fetchNews() async {
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

          // tao doi tuong(instance) Article
          Article article = new Article(
              author: element["author"],
              title: element["title"],
              desc: element["description"],
              imgSrc: element["urlToImage"],
              publishedAt: element["publishedAt"],
              content: element["content"]);
          // Them article vao news
          print("imgSrc: ${article.imgSrc}");

          news.add(article);
          print('news: $news');
        }
      });
    } else {
      throw Exception("Failed to load API");
    }
  }
}
