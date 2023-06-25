import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:the_news_app/core/usecase/usecase.dart';
import 'package:the_news_app/features/news_app_basic_feature/domain/entities/article_entities.dart';
import 'package:the_news_app/features/news_app_basic_feature/domain/repository/get_list_of_article_repo.dart';
import 'package:the_news_app/features/news_app_basic_feature/domain/usecase/get_list_of_article_use_case.dart';

class GetListOfArticleRepoTest extends Mock implements GetListOfArticleRepo {}

main() {
  late GetListOfArticleRepoTest articleRepo;
  late GetListOfArticleUseCase useCase;

  setUp(() {
    articleRepo = GetListOfArticleRepoTest();
    useCase = GetListOfArticleUseCase(articleRepo: articleRepo);
  });

  final staticResult = [
    const ArticleEntities(
        uuid: "uuid",
        title: "title",
        description: "description",
        snippet: "snippet",
        imageUrl: "imageUrl",
        publishedAt: "publishedAt")
  ];
  test("GetListOfArticleUseCase should be a subclass of Usecase", () {
    expect(useCase, isA<UseCase>());
  });

  test("Test the get list of article usecase", () async {
    //Arrange
    when(articleRepo.getListOfArticle)
        .thenAnswer((invocation) async => Right(staticResult));
    //Act
    final result=await useCase();
    //Assert
    expect(result, equals(Right(staticResult)));
    verify(articleRepo.getListOfArticle);
    verifyNoMoreInteractions(articleRepo);
  });
}
