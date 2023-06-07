import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:the_news_app/models/article.dart';
import 'package:the_news_app/repositories/news_repository.dart';

class LatestNewsListProvider extends ChangeNotifier {
  bool isLoading = true;
  List<Article>? listOfArticle;

  Future<List<Article>?> getLatestNewsList() async {
    try {
      final response = await NewsRepository().getAPI();
      listOfArticle = List.from(response.data["data"]
          .map((singleModel) => Article.fromJson(singleModel)));
    } on DioError catch (e) {
      if(kDebugMode){
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      }
    }
    isLoading = false;
    notifyListeners();
    return listOfArticle;
  }
}
