import 'package:dartz/dartz.dart';
import 'package:the_news_app/features/news_app_basic_feature/domain/entities/article_entities.dart';

abstract class GetListOfArticleRepo{
  Future<Either<Error,List<ArticleEntities>>> getListOfArticle();
}