import 'package:dartz/dartz.dart';
import 'package:the_news_app/core/usecase/usecase.dart';
import 'package:the_news_app/features/news_app_basic_feature/domain/entities/article_entities.dart';
import 'package:the_news_app/features/news_app_basic_feature/domain/repository/get_list_of_article_repo.dart';

class GetListOfArticleUseCase extends UseCase<List<ArticleEntities>>{
  final GetListOfArticleRepo _articleRepo;

  GetListOfArticleUseCase({required GetListOfArticleRepo articleRepo})
      : _articleRepo = articleRepo;

  @override
  Future<Either<Error, List<ArticleEntities>>> call() {
    return _articleRepo.getListOfArticle();
  }


}
