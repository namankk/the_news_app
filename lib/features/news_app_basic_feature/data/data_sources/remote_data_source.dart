import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:the_news_app/core/constants.dart';
import 'package:the_news_app/features/news_app_basic_feature/data/models/article.dart';

abstract class DataSource {
  Future<List<Article>> getDataFromRemoteDataSource();
}

class RemoteDataSource extends DataSource {
  final Dio _dio;

  RemoteDataSource({required Dio dio}) : _dio = dio {
    _dio.interceptors.add(
        DioCacheManager(CacheConfig(baseUrl: APIConstants.baseUrl))
            .interceptor);
  }

  @override
  Future<List<Article>> getDataFromRemoteDataSource() async {
    List<Article> listModel;
    final response = await _dio.get(APIConstants.listOfLatestNewsAPI,options: buildCacheOptions(const Duration(days: 7)));
    if (response.statusCode == 200) {
      try{
        listModel = List<Article>.from(
            response.data["data"].map((model) => Article.fromJson(model)));
      }catch(e){
        throw Exception(e);
      }
    } else {
      throw DioError(requestOptions: response.requestOptions);
    }
    return listModel;
  }
}
