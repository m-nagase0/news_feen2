import 'package:flutter/material.dart';
import 'package:news_feed_2/model/news_model.dart';
import 'package:news_feed_2/view/components/image_from_url.dart';

class HeadLineItem extends StatelessWidget {
  final Article article;

  final ValueChanged onArticleClicked;

  const HeadLineItem(
      {Key? key, required this.article, required this.onArticleClicked})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: InkWell(
        onTap: () => onArticleClicked(article),
        child: Stack(
          fit: StackFit.expand,
          children: [
            DecoratedBox(
              position: DecorationPosition.foreground,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  Colors.black87,
                  Colors.black26,
                ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter
              )),
              child: ImageFromUrl(
                imageUrl: article.urlToImage,
              ),
            ),
            Positioned(
              bottom: 56.0,
              right: 32.0,
              left: 32.0,
              child: Text(
                article.title ?? "",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
