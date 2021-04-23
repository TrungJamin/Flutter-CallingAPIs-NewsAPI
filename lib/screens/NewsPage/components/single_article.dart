import 'package:calling_api/dataclasses/article.dart';
import 'package:calling_api/screens/DetailPage/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SingleArticle extends StatelessWidget {
  final Article article;
  const SingleArticle({
    Key key,
    this.article,
  }) : super(key: key);
  navigateToDetailScreen(context) {
    print('tojson: ${article.toJson()}');
    Navigator.pushNamed(context, DetailScreen.routeName,
        arguments: Article.fromJson(article.toJson()));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // TITLE
          GestureDetector(
            child: Text(
              article.title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            onTap: () {
              navigateToDetailScreen(context);
            },
          ),

          // Use CachedNetworkImage
          SizedBox(
            height: size.height * 0.01,
          ),
          // Published At
          Text("${article.publishedAt}"),
          SizedBox(
            height: size.height * 0.02,
          ),

          // Image
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: InkResponse(
                highlightColor: Colors.pinkAccent.withOpacity(0.5),
                splashColor: Colors.indigo,
                child: CachedNetworkImage(
                  imageUrl: article.imgSrc,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                onTap: () {
                  navigateToDetailScreen(context);
                },
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),

          // Description
          Text(article.desc, style: TextStyle(color: Colors.black54))
        ],
      ),
    );
  }
}
