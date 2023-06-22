
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:the_news_app/features/news_app_basic_feature/data/models/article.dart';
import 'package:the_news_app/features/news_app_basic_feature/domain/usecase/get_list_of_article_use_case.dart';
import 'package:the_news_app/features/news_app_basic_feature/presenter/bloc/latest_news_list_page_bloc/latest_news_list_bloc.dart';
import 'package:the_news_app/features/news_app_basic_feature/presenter/bloc/latest_news_list_page_bloc/latest_news_list_events.dart';
import 'package:the_news_app/features/news_app_basic_feature/presenter/bloc/latest_news_list_page_bloc/latest_news_list_states.dart';


class MockGetListOfArticleUseCase extends Mock
    implements GetListOfArticleUseCase {}

void main() {
  late MockGetListOfArticleUseCase useCase;
  late LatestNewListBloc latestNewListBloc;

  setUp(() {
    useCase = MockGetListOfArticleUseCase();
    latestNewListBloc = LatestNewListBloc(useCase);
  });

  group("Testing latest news bloc", () {
    final tDataModel = [
      Article(
          uuid: "uuid",
          title: "title",
          description: "description",
          snippet: "snippet",
          imageUrl: "imageUrl",
          publishedAt: "publishedAt")
    ];
    const emptyState = TypeMatcher<LatestNewsListEmpty>();
    const loadingState = TypeMatcher<LatestNewsListLoading>();
    test("Initial state should be empty", () {
      //Arrange
      expect(latestNewListBloc.state, LatestNewsListEmpty());
      //Act
      //Assert
    });
    test("Initial state should be empty", () async {
      //Arrange
      when(() => useCase.call())
          .thenAnswer((invocation) async => Right(tDataModel));
      latestNewListBloc.add(OnLatestNewsViewInitialise());
      expectLater(
          latestNewListBloc.state, emitsInOrder([emptyState, loadingState]));

      //Act
      //Assert
    });
  });

  tearDown(() => latestNewListBloc.close());
}
