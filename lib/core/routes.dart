import 'package:go_router/go_router.dart';
import 'package:the_news_app/features/news_app_basic_feature/data/models/article.dart';
import 'package:the_news_app/features/news_app_basic_feature/presenter/pages/news_details_page.dart';

import '../features/news_app_basic_feature/presenter/pages/latest_news_list_page.dart';

final appRoutes=GoRouter(initialLocation: "/",routes: [
  GoRoute(path: "/",name: GoRouteNames.listPage,builder: (context,state)=>const LatestNewsListPage()),
  GoRoute(path: "/page2",name: GoRouteNames.detailsPage,builder: (context,state){
    return NewsDetailsPage(article: state.extra as Article);
  })
]);

class GoRouteNames{
  static const String listPage="ListPage";
  static const String detailsPage="DetailsPage";
}