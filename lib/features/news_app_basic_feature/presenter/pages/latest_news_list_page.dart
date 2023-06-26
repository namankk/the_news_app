import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:the_news_app/features/news_app_basic_feature/presenter/bloc/latest_news_bottom_navigation_bloc/latest_news_bottom_nav_bar_items.dart';
import 'package:the_news_app/features/news_app_basic_feature/presenter/bloc/latest_news_bottom_navigation_bloc/latest_news_bottom_navigation_bloc.dart';
import 'package:the_news_app/features/news_app_basic_feature/presenter/bloc/latest_news_bottom_navigation_bloc/latest_news_bottom_navigation_states.dart';
import 'package:the_news_app/features/news_app_basic_feature/presenter/bloc/latest_news_list_page_bloc/latest_news_list_bloc.dart';
import 'package:the_news_app/features/news_app_basic_feature/presenter/bloc/latest_news_list_page_bloc/latest_news_list_events.dart';
import 'package:the_news_app/features/news_app_basic_feature/presenter/bloc/latest_news_list_page_bloc/latest_news_list_states.dart';

import '../../../../core/routes.dart';
import '../widgets/common_widgets.dart';
import '../widgets/news_tile_widget.dart';

class LatestNewsListPage extends StatelessWidget {
  const LatestNewsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(mainAxisAlignment: MainAxisAlignment.center),
      bottomNavigationBar: BlocBuilder<LatestNewsBottomNavigationBloc,
          LatestNewsBottomNavigationState>(builder: (context, state) {
        if (state is LatestNewsBottomNavigationCurrentState) {
          return BottomNavigationBar(
              currentIndex: state.currentIndex,
              onTap: (newIndex) {
                print(newIndex);
                // late NavBarItems navBarItems;
                // switch (newIndex) {
                //   case 0:
                //     navBarItems = NavBarItems.home;
                //     break;
                //   case 1:
                //     navBarItems = NavBarItems.latestNews;
                //     break;
                //   case 2:
                //     navBarItems = NavBarItems.details;
                //     break;
                // }

                context.goNamed(GoRouteNames.detailsSecondPage);
              },
              items: [
                BottomNavigationBarItem(
                    icon: const Icon(Icons.home),
                    label: NavBarItems.home.toString()),
                BottomNavigationBarItem(
                    icon: const Icon(Icons.pages_rounded),
                    label: NavBarItems.latestNews.toString()),
                BottomNavigationBarItem(
                    icon: const Icon(Icons.access_alarms_sharp),
                    label: NavBarItems.details.toString())
              ]);
        } else {
          return  const SizedBox.shrink();
        }
      }),
      body: BlocBuilder<LatestNewListBloc, LatestNewsListStates>(
        builder: (context, state) {
          if (state is LatestNewsListEmpty) {
            return Center(
                child: Text(
              "Something went wrong",
              maxLines: 2,
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ));
          } else if (state is LatestNewsListLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LatestNewsListError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Something went wrong",
                    maxLines: 2,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        context
                            .read<LatestNewListBloc>()
                            .add(OnLatestNewsViewInitialise());
                      },
                      child: const Text("Retry"))
                ],
              ),
            );
          } else if (state is LatestNewsListHasData) {
            return RefreshIndicator(
              onRefresh: () async {
                return context
                    .read<LatestNewListBloc>()
                    .add(OnLatestNewsViewInitialise());
              },
              child: BlocBuilder<LatestNewsBottomNavigationBloc,
                      LatestNewsBottomNavigationState>(
                  builder: (context, bottomNavState) {
                if (bottomNavState is LatestNewsBottomNavigationCurrentState) {
                  switch (bottomNavState.currentIndex) {
                    case 0:
                      return Container(
                        margin: const EdgeInsets.only(top: 16),
                        child: ListView.builder(
                            itemCount: state.result.length,
                            shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  context.goNamed(GoRouteNames.detailsPage,
                                      extra: state.result[index]);
                                  // Navigator.of(context).pushNamed("NewsDetailsPage",
                                  //     arguments: state.result[index]);
                                },
                                child: NewsTile(
                                  imgUrl: state.result[index].imageUrl,
                                  title: state.result[index].title,
                                  desc: state.result[index].description,
                                  content: state.result[index].snippet,
                                ),
                              );
                            }),
                      );
                    case 1:
                      return const Center(child: Text("Latest news Page"));
                    case 2:
                      return const Center(
                        child: Text("Details page"),
                      );
                    default:
                      return const Text("No Case found");
                  }
                } else {
                  return const Text("Error no page");
                }
              }),
            );
          } else {
            return const Center(child: Text("Error In Code"));
          }
        },
      ),
    );
  }
}
