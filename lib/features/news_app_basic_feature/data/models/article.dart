import 'package:the_news_app/features/news_app_basic_feature/domain/entities/article_entities.dart';

class Article extends ArticleEntities {
  const Article(
      {required super.uuid,
      required super.title,
      required super.description,
      required super.snippet,
      required super.imageUrl,
      required super.publishedAt});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      uuid: json["uuid"] ?? "",
      title: json["title"] ?? "",
      description: json["description"] ?? "",
      snippet: json["snippet"] ?? "",
      imageUrl: json["image_url"] ?? "",
      publishedAt: json["published_at"] ?? "",
    );
  }
}


