import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_news_app/core/routes.dart';
import 'package:the_news_app/core/service_locator.dart' as di;
import 'package:the_news_app/features/news_app_basic_feature/presenter/bloc/latest_news_bottom_navigation_bloc/latest_news_bottom_navigation_bloc.dart';
import 'package:the_news_app/features/news_app_basic_feature/presenter/bloc/latest_news_list_page_bloc/latest_news_list_bloc.dart';

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>di.locator<LatestNewListBloc>()),
        BlocProvider(create: (context)=>di.locator<LatestNewsBottomNavigationBloc>())
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: appRoutes,
        // home: const LatestNewsListPage(),
        // onGenerateRoute: (routes) {
        //   switch (routes.name) {
        //     case RouteNames.newsDetailsPage:
        //       return MaterialPageRoute(builder: (context) {
        //         Article article = routes.arguments as Article;
        //         return NewsDetailsPage(
        //           article: article,
        //         );
        //       });
        //   }
        //   return null;
        // },
      ),
    );
  }
}
