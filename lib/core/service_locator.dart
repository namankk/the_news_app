import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:the_news_app/features/news_app_basic_feature/data/data_sources/remote_data_source.dart';
import 'package:the_news_app/features/news_app_basic_feature/data/repository_impl/repository_impl.dart';
import 'package:the_news_app/features/news_app_basic_feature/domain/usecase/get_list_of_article_use_case.dart';
import 'package:the_news_app/features/news_app_basic_feature/presenter/bloc/latest_news_list_page_bloc/latest_news_list_bloc.dart';
import 'package:the_news_app/features/news_app_basic_feature/presenter/bloc/latest_news_list_page_bloc/latest_news_list_events.dart';

final locator = GetIt.instance;

void init() {
  locator.registerFactory(() => LatestNewListBloc(locator())..add(OnLatestNewsViewInitialise()));

  locator
      .registerFactory(() => GetListOfArticleUseCase(articleRepo: locator<RepositoryImpl>()));

  locator.registerLazySingleton(() => RepositoryImpl(dataSource: locator<RemoteDataSource>()));

  locator.registerLazySingleton(() => RemoteDataSource(dio: locator<Dio>()));

  locator.registerLazySingleton(() => Dio());
}
