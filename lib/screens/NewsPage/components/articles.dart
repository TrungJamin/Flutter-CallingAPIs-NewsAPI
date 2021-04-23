import 'package:calling_api/dataclasses/article.dart';
import 'package:calling_api/screens/NewsPage/components/single_article.dart';
import 'package:flutter/material.dart';

class Articles extends StatelessWidget {
  const Articles({
    Key key,
    @required this.news,
  }) : super(key: key);

  final List<Article> news;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.9,
      padding: EdgeInsets.symmetric(vertical: 20),
      child: ListView.builder(
          physics: ClampingScrollPhysics(),
          itemCount: news.length,
          itemBuilder: (context, index) {
            print('article: ${news[index]}');

            return SingleArticle(
              article: news[index],
            );
          }),
    );
  }
}
