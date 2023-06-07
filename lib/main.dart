import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_news_app/pages/latest_news_list_page.dart';
import 'package:the_news_app/pages/news_details_page.dart';
import 'package:the_news_app/providers/latest_news_list_provider.dart';
import 'package:the_news_app/providers/news_details_provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider(
        create: (context)=>LatestNewsListProvider(),
        builder: (context,_) {
          return const LatestNewsListPage();
        }
      ),
      onGenerateRoute: (routes){
        switch(routes.name){
          case "NewsDetailsPage":
            return MaterialPageRoute(builder: (context)=>ChangeNotifierProvider(
              create: (context)=>NewsDetailsProvider(),
              builder: (context,_) {
                return const NewsDetailsPage();
              }
            ));
        }
        return null;
      },
    );
  }
}
