import 'package:go_router/go_router.dart';
import 'package:the_news_app/features/news_app_basic_feature/data/models/article.dart';
import 'package:the_news_app/features/news_app_basic_feature/presenter/pages/news_details_page.dart';
import 'package:the_news_app/features/news_app_basic_feature/presenter/pages/news_details_second_page.dart';

import '../features/news_app_basic_feature/presenter/pages/latest_news_list_page.dart';

// final appRoutes = GoRouter(initialLocation: "/", routes: [
//   GoRoute(
//       path: "/",
//       name: GoRouteNames.listPage,
//       builder: (context, state) => const LatestNewsListPage(),
//       routes: [
//         GoRoute(
//             path: "page2",
//             name: GoRouteNames.detailsPage,
//             builder: (context, state) {
//               var value = state.extra ??
//                   const Article(
//                       uuid: "uuid",
//                       title: "title",
//                       description: "description",
//                       snippet: "snippet",
//                       imageUrl: "imageUrl",
//                       publishedAt: "publishedAt");
//               return NewsDetailsPage(article: value as Article);
//             },
//             routes: [
//               GoRoute(
//                   path: "secondPage",
//                   name: GoRouteNames.detailsSecondPage,
//                   builder: (context, state) {
//                     var value = state.extra ??
//                         const Article(
//                             uuid: "uuid",
//                             title: "title",
//                             description: "description",
//                             snippet: "snippet",
//                             imageUrl: "imageUrl",
//                             publishedAt: "publishedAt");
//                     return NewsDetailsSecondPage(article: value as Article);
//                   })
//             ]),
//       ]),
// ]);

final webRoutes = GoRouter(debugLogDiagnostics: true,initialLocation: "/home",routerNeglect: true, routes: [
  GoRoute(
      path: "/home",
      name: GoRouteNames.listPage,
      builder: (context, state) => const LatestNewsListPage(),
      routes: [
        GoRoute(
            path: "page2",
            name: GoRouteNames.detailsPage,
            builder: (context, state) {
              var value = state.extra ??
                  const Article(
                      uuid: "uuid",
                      title: "title",
                      description: "description",
                      snippet: "snippet",
                      imageUrl: "imageUrl",
                      publishedAt: "publishedAt");
              return NewsDetailsPage(article: value as Article);
            },
        ),
        GoRoute(
            path: "secondPage",
            name: GoRouteNames.detailsSecondPage,
            builder: (context, state) {
              var value = state.extra ??
                  const Article(
                      uuid: "uuid",
                      title: "title",
                      description: "description",
                      snippet: "snippet",
                      imageUrl: "imageUrl",
                      publishedAt: "publishedAt");
              return NewsDetailsSecondPage(article: value as Article);
            })
      ]),
]);

class GoRouteNames {
  static const String listPage = "/";
  static const String detailsPage = "page2";
  static const String detailsSecondPage = "secondPage";
}
