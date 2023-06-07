import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:the_news_app/repositories/base_repository.dart';

class NewsRepository extends BaseRepository {
  static final NewsRepository _instance = NewsRepository._();
  final Dio _dio = Dio();


  NewsRepository._();

  factory NewsRepository() {
    return _instance;
  }

  @override
  Future<Response> getAPI() async {
    _dio.interceptors.add(
        DioCacheManager(CacheConfig(baseUrl: "https://api.thenewsapi.com"))
            .interceptor);

    return await _dio.get(
        "https://api.thenewsapi.com/v1/news/top?api_token=SpnZ3P64u1UZ3KLWsHTnR3TYBIQjVq3Th5xzUrTL&locale=us&limit=3&page=1",
        options: buildCacheOptions(const Duration(days: 7)));
  }
}
