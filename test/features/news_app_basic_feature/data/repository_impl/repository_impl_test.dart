import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:the_news_app/features/news_app_basic_feature/data/data_sources/remote_data_source.dart';
import 'package:the_news_app/features/news_app_basic_feature/data/models/article.dart';
import 'package:the_news_app/features/news_app_basic_feature/data/repository_impl/repository_impl.dart';
import 'package:the_news_app/features/news_app_basic_feature/domain/entities/article_entities.dart';

class MockRemoteDataSource extends Mock implements RemoteDataSource {}

void main() {
  late MockRemoteDataSource mockRemoteDataSource;
  late RepositoryImpl repositoryImpl;
  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    repositoryImpl = RepositoryImpl(dataSource: mockRemoteDataSource);
  });
  group("Check repo impl", () {
    List<Article> tListOfArticle = [
      const Article(uuid: "uuid",
          title: "title",
          description: "description",
          snippet: "snippet",
          imageUrl: "imageUrl",
          publishedAt: "publishedAt")
    ];
    test("Is type of entities", ()async{
      expect(tListOfArticle, isA<List<ArticleEntities>>());
    });

    test("Checking Remote Data source", () async{

      //Arrange
      when(mockRemoteDataSource.getDataFromRemoteDataSource).thenAnswer((
          invocation)async =>tListOfArticle);
      //Act
      final result=await repositoryImpl.getListOfArticle();
      //Assert
      expect(result, Right(tListOfArticle));
    });
  });

}