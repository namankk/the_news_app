import 'package:dartz/dartz.dart';
import 'package:the_news_app/features/news_app_basic_feature/domain/entities/article_entities.dart';
import 'package:the_news_app/features/news_app_basic_feature/domain/repository/get_list_of_article_repo.dart';

class GetListOfArticleUseCase {
  final GetListOfArticleRepo _articleRepo;

  GetListOfArticleUseCase({required GetListOfArticleRepo articleRepo})
      : _articleRepo = articleRepo;

  Future<Either<Error,List<ArticleEntities>>> initializeListScreen(){
    return _articleRepo.getListOfArticle();
  }
}
