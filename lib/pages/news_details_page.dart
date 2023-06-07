import 'package:flutter/material.dart';
import 'package:the_news_app/models/article.dart';
import 'package:the_news_app/widgets/common_widgets.dart';
import 'package:the_news_app/widgets/news_tile_widget.dart';

class NewsDetailsPage extends StatelessWidget {
  final Article article;

  const NewsDetailsPage({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(mainAxisAlignment: MainAxisAlignment.start),
      body: NewsTile(
        imgUrl: article.imageUrl,
        title: article.title,
        desc: article.description,
        content: article.snippet,
      ),
    );
  }
}
