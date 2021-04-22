import 'package:calling_api/screens/DetailPage/detail_screen.dart';
import 'package:calling_api/screens/NewsPage/news_screen.dart';

import 'package:flutter/material.dart';

import 'dataclasses/article.dart';
import 'dataclasses/news.dart';
// api key: 724c976df9074928a7c346fbd6c7f438

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Article> news = new List<Article>();
  @override
  void initState() {
    super.initState();

    this.getNews();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.fetchNews();
    news = newsClass.news;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (settings) {
        // Cast the arguments to the correct
        // type: Article.
        final Article args = settings.arguments as Article;
        switch (settings.name) {
          case '/detailScreen':
            // Then, extract the required data from
            // the arguments and pass the data to the
            // correct screen.
            return MaterialPageRoute(
                settings: RouteSettings(name: DetailScreen.routeName),
                builder: (context) => DetailScreen(
                      title: args.title,
                      imgUrl: args.imgSrc,
                      content: args.content,
                      pulishedAt: args.publishedAt,
                    ));
          default:
            return MaterialPageRoute(
                builder: (_) => Scaffold(
                      appBar: AppBar(
                        title: Text("ERROR"),
                      ),
                      body: Center(
                        child: Text("ERROR"),
                      ),
                    ));
        }
      },
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch News'),
        ),
        body: NewsScreen(news: news),
      ),
    );
  }
}

// navigation(tab bar), firebase authentication, local database.
