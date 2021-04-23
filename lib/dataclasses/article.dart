class Article {
  final String author;
  final String title;
  final String desc;
  final String imgSrc;
  final String publishedAt;
  final String content;
  Article(
    this.author,
    this.title,
    this.desc,
    this.imgSrc,
    this.publishedAt,
    this.content,
  );
  Article.fromJson(Map<String, dynamic> json)
      : author = json['author'],
        title = json['title'],
        desc = json['description'],
        imgSrc = json['urlToImage'],
        publishedAt = json['publishedAt'],
        content = json['content'];
  Map<String, dynamic> toJson() => {
        'author': author,
        'title': title,
        'description': desc,
        'urlToImage': imgSrc,
        'publishedAt': publishedAt,
        'content': content,
      };
}
