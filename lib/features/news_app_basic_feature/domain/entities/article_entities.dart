import 'package:equatable/equatable.dart';

class ArticleEntities extends Equatable{
  final String uuid;
  final String title;
  final String description;
  final String snippet;
  final String imageUrl;
  final String publishedAt;

  const ArticleEntities({required this.uuid, required this.title, required this.description, required this.snippet,
    required this.imageUrl, required this.publishedAt});

  @override
  List<Object?> get props => [uuid,title,description,snippet,imageUrl,publishedAt];
}