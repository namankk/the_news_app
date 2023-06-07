import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:the_news_app/models/Article.dart';
import 'package:the_news_app/repositories/news_repository.dart';

class LatestNewsListProvider extends ChangeNotifier{
bool showLoading=true;
List<Article>? listOfArticle;

Future<List<Article>?> getLatestNewsList() async {
  try{
    final response=await NewsRepository().getAPI();
    listOfArticle=List.from(response.data["data"].map((singleModel)=>Article.fromJson(singleModel)));

  }on DioError catch(e){
    if (e.response != null) {
      print('Dio error!');
      print('STATUS: ${e.response?.statusCode}');
      print('DATA: ${e.response?.data}');
      print('HEADERS: ${e.response?.headers}');
    } else {
      // Error due to setting up or sending the request
      print('Error sending request!');
      print(e.message);
    }
  }
  showLoading=false;
  notifyListeners();
  return listOfArticle;

}
}