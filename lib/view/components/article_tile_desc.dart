import 'package:flutter/material.dart';
import 'package:news_feed_2/model/news_model.dart';

class ArticleTileDescription extends StatelessWidget {
  final Article article;

  const ArticleTileDescription({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(article.title ?? ""),
        Text(article.publishedDate ?? ""),
        Text(article.description ?? ""),
      ],
    );
  }
}
