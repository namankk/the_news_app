import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:the_news_app/core/constants.dart';

import 'base_repository.dart';

class NewsRepository extends BaseRepository {
  static final NewsRepository _instance = NewsRepository._internal();
  final Dio _dio = Dio();

  NewsRepository._internal() {
    _dio.interceptors.add(
        DioCacheManager(CacheConfig(baseUrl: APIConstants.baseUrl))
            .interceptor);
  }

  factory NewsRepository() {
    return _instance;
  }

  @override
  Future<Response> getAPI() async {
    return await _dio.get(APIConstants.listOfLatestNewsAPI,
        options: buildCacheOptions(const Duration(days: 7)));
  }

  @override
  Future<Response> postAPI() {
    // TODO: implement postAPI
    throw UnimplementedError();
  }
}
