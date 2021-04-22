import 'package:calling_api/dataclasses/article.dart';
import 'package:flutter/material.dart';

import 'components/articles.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({
    Key key,
    @required this.news,
  }) : super(key: key);

  final List<Article> news;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Articles(
        news: news,
      ),
    );
  }
}
