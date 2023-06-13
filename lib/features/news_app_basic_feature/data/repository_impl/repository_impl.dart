import 'package:dartz/dartz.dart';
import 'package:the_news_app/features/news_app_basic_feature/data/data_sources/remote_data_source.dart';
import 'package:the_news_app/features/news_app_basic_feature/domain/entities/article_entities.dart';
import 'package:the_news_app/features/news_app_basic_feature/domain/repository/get_list_of_article_repo.dart';

class RepositoryImpl extends GetListOfArticleRepo {
  final DataSource _dataSource;

  RepositoryImpl({required DataSource dataSource}) : _dataSource = dataSource;

  @override
  Future<Either<Error, List<ArticleEntities>>> getListOfArticle() async {
    try {
      final response = await _dataSource.getDataFromRemoteDataSource();
      return Right(response);
    } catch (e) {
      return Left(Error());
    }
  }
}
