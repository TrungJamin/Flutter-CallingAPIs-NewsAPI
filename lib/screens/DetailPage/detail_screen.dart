import 'package:calling_api/dataclasses/article.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DetailScreen extends StatelessWidget {
  static const routeName = '/detailScreen';
  final Article article;
  const DetailScreen({
    Key key,
    this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Screen"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        width: size.width,
        height: size.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                article.title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              // Use CachedNetworkImage
              SizedBox(
                height: size.height * 0.01,
              ),
              Text("${article.publishedAt}"),
              SizedBox(
                height: size.height * 0.02,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: CachedNetworkImage(
                  imageUrl: article.imgSrc,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              Text(article.content)
            ],
          ),
        ),
      ),
    );
  }
}
