import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_news_app/core/constants.dart';
import 'package:the_news_app/models/article.dart';
import 'package:the_news_app/pages/latest_news_list_page.dart';
import 'package:the_news_app/pages/news_details_page.dart';
import 'package:the_news_app/providers/latest_news_list_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider(
          create: (context) => LatestNewsListProvider(),
          builder: (context, _) {
            return const LatestNewsListPage();
          }),
      onGenerateRoute: (routes) {
        switch (routes.name) {
          case RouteNames.newsDetailsPage:
            return MaterialPageRoute(builder: (context) {
              Article article = routes.arguments as Article;
              return NewsDetailsPage(
                article: article,
              );
            });
        }
        return null;
      },
    );
  }
}
